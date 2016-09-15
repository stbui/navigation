'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    async indexAction() {
        const links = await this.model('links').getList();

        this.assign({
            data: links
        });

        return this.display();
    }

    async addAction() {
        if (this.isPost()) {
            const param = this.param();
            this.model('links').add(param);
            this.redirect('/admin/link.html');
        }

        const catalog = this.model('catalog').select();
        this.assign({
            data: catalog
        });

        return this.display();
    }

    editAction() {
        const {id, title, link} = this.param();
        let links = this.model('links');
        if (this.isPost()) {
            links = links.where({id}).update({title, link});
            this.redirect('/admin/link.html');
            this.assign('data', []);
        } else {
            links = links.where({id}).find();
            this.assign('data', links);
        }

        return this.display();
    }

    deleteAction() {
        const {id} = this.param();
        this.model('links').where({id}).delete();
        this.redirect('/admin/link.html');
    }
}