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


        let data = [];
        catalog.forEach(value=> {

            links.forEach(item => {
                if (value.id == item.catalog_id) {
                    data.push(item);
                }
            });

        });



        this.json(links);
        //

        //
        this.assign('links', links);
        this.assign('catalog', catalog);
        this.assign('data', data);


        // return this.display();
    }
}