'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    async indexAction() {
        const links = await this.model('links').order('id desc').select();
        const catalog = await this.model('catalog').select();

        this.assign({
            links: links,
            catalog: catalog,
            data: catalog
        });

        return this.display('default');
    }
}