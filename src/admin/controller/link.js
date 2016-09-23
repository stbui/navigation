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
        const {title, link, catalog_id, sort_order, description, status_is, image_link} = param;
        const {type, page} = param;

        let links = this.model('links');
        if (this.isPost()) {
            links = links.where({id}).update({title, link, catalog_id, sort_order, description, image_link, status_is});

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