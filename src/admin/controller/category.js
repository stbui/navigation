'use strict';

import Base from './base.js';

export default class extends Base {

    __before() {
        this.navType = 'category';
    }

    indexAction() {
        const {page} = this.get();
        const catalog = this.model('catalog').order('sort_order asc').getPage(page);

        this.assign({
            catalog: catalog
        });

        return this.display();
    }

    addAction() {
        if (this.isPost()) {
            const param = this.param();
            this.model('catalog').add(param);
            this.redirect('/admin/category.html');
        }

        return this.display();
    }

    editAction() {
        const {id, catalog_name, sort_order} = this.param();
        let catalog = this.model('catalog');
        if (this.isPost()) {
            catalog = catalog.where({id}).update({catalog_name, sort_order});
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