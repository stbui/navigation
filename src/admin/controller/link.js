'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    indexAction() {
        const links = this.model('links').getList();
        this.assign({
            data: links
        });

        return this.display();
    }

    addAction() {
        if (this.isPost()) {
            const param = this.param();
            this.model('links').add(param);
            this.redirect('/admin/link.html');
        }

        // 显示分类
        const catalog = this.model('catalog').select();
        this.assign({
            data: catalog
        });

        return this.display();
    }

    editAction() {
        const {id, title, link, catalog_id,sort_order} = this.param();
        let links = this.model('links');
        if (this.isPost()) {
            links = links.where({id}).update({title, link, catalog_id,sort_order});
            this.redirect('/admin/link.html');
            this.assign('data', []);
        } else {
            links = links.getSingleList({id});
            const catalog = this.model('catalog').select();
            this.assign({
                data: links,
                catalog: catalog
            });
        }

        return this.display();
    }

    deleteAction() {
        const {id} = this.param();
        this.model('links').where({id}).delete();
        this.redirect('/admin/link.html');
    }

    async searchAction() {
        const {keywork} = this.post();
        const links =await this.model('links').searchTitleList(keywork);

        // this.json(links)
        this.assign({
            data: links
        });

        return this.display();
    }
}