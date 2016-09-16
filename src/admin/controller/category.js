'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    async indexAction() {
        const catalog = await this.model('catalog').getPage();

        this.assign('data', catalog);

        return this.display();
    }

    addAction () {
        if (this.isPost()) {
            const param = this.param();
            this.model('catalog').add(param);
            this.redirect('/admin/category.html');
        }

        return this.display();
    }

    editAction() {
        const {id, catalog_name} = this.param();
        let catalog = this.model('catalog');
        if (this.isPost()) {
            catalog = catalog.where({id}).update({catalog_name});
            this.redirect('/admin/category.html');
        } else {
            catalog = catalog.where({id}).find();
            this.assign('data', catalog);
        }

        return this.display();
    }

    delAction() {
        const {id} = this.param();
        this.model('catalog').where({id}).delete();
        this.redirect('/admin/category.html');
    }
}