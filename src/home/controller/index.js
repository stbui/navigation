'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    async indexAction() {
        const {num} = this.get();
        const links = await this.model('links').getPage(1);
        const catalog = await this.model('catalog').getPage(1);

        this.assign({
            links: links,
            catalog: catalog,
            data: catalog
        });

        return this.display();
    }
}