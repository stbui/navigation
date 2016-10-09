'use strict';

import Base from './base.js';

export default class extends Base {

    indexAction() {
        const {page} = this.get();
        const links = this.model('links').showSatus(page);
        this.assign({
            links: links
        });

        return this.display();
    }

    async addAction() {
        if (this.isPost()) {
            const param = this.param();
            const result = await this.model('links').thenAdd(param, {link: param.link});

            if (result.type == 'exist') {
                this.write('来迟一步，系统已有该网址了 <a href="/admin/link/add">重新添加</a>')
            }

            this.redirect('/admin/link.html');
        }

        // 显示分类
        const catalog = this.model('catalog').order('sort_order asc').select();
        this.assign({
            data: catalog
        });

        return this.display();
    }

    editAction() {
        const param = this.param();
        const {id} = param;
        const {title, link, catalog_id, sort_order, description, status_is, image_link,link_github} = param;
        const {type, page} = param;

        let links = this.model('links');
        if (this.isPost()) {
            links = links.where({id}).update({title, link,link_github, catalog_id, sort_order, description, image_link, status_is});

            switch (type) {
                case 'status':
                    this.redirect('/admin/link/search.html?type=' + type);
                    break;
                case 'catalog':
                    this.redirect('/admin/link/search.html?type=' + type);
                    break;
                default:
                    this.redirect('/admin/link.html?page=' + page);
                    break;
            }

            this.assign('data', []);
        } else {
            links = links.getSingleList({id});
            const catalog = this.model('catalog').order('sort_order asc').select();
            this.assign({
                data: links,
                catalog: catalog
            });
        }

        return this.display();
    }

    deleteAction() {
        const {id} = this.param();
        this.model('links').where({id}).update({status_is: 'N'});

        this.redirect('/admin/link.html');
    }

    async repeatAction() {
        const {page} = this.get();
        const links = await this.model('links').order('title asc').select();
        let data = links;

        let result = [];
        for (var i = 0; i < data.length - 1; i++) {
            if(page == 'link') {
                if (data[i+1].link == data[i].link) {

                    let l = data[i].link.length >80 ? data[i].link.substring(0,80):data[i].link;

                    result.push({
                        id: data[i].id,
                        title: data[i].title,
                        link:l,
                    });
                }
            } else {
                if (data[i+1].title == data[i].title) {

                    let l = data[i].link.length >80 ? data[i].link.substring(0,80):data[i].link;

                    result.push({
                        id: data[i].id,
                        title: data[i].title,
                        link:l,
                    });
                }
            }
        }

        this.assign({
            links: result,
            repeat_name: result
        });

        // this.json(result)

        return this.display();
    }

    searchAction() {
        const {keywork, type, page} = this.param();
        const links = this.model('links');
        let data;

        switch (type) {
            case 'catalog':
                data = links.searchCategoryList(keywork, page);
                break;
            case 'status':
                data = links.searchStatusList(keywork, page);
                break;
            default:
                data = links.searchTitleList(keywork, page);
                break;
        }

        this.assign({
            links: data,
            type: type
        });

        return this.display();
    }
}