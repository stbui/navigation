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
        const {id, title, link, catalog_id, sort_order, description, status_is, image_link, page} = this.param();
        let links = this.model('links');
        if (this.isPost()) {
            console.log(this.param())
            links = links.where({id}).update({title, link, catalog_id, sort_order, description, image_link, status_is});

            this.redirect('/admin/link.html?page=' + page);
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
        const {keywork, type} = this.param();

        switch (type) {
            case 'catalog':
                this.searchCategory(keywork);
                break;
            case 'status':
                this.searchStatus(keywork)
                break;
            default:
                this.searchTitle(keywork);
                break;
        }
    }

    searchTitle(keywork) {
        const links = this.model('links').searchTitleList(keywork);

        this.assign({
            links: links
        });

        return this.display();
    }

    searchStatus(keywork) {
        const links = this.model('links').searchStatusList(keywork);

        this.assign({
            links: links
        });

        return this.display();
    }

    searchCategory(keywork) {
        const links = this.model('links').searchCategoryList(keywork);

        this.assign({
            links: links
        });

        return this.display();
    }
}