'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
     async indexAction() {
        const {id} = this.get();
        const links =  this.model('links').getPage();
        const catalog =await  this.model('catalog').where({id}).select();

        const template = {
            default:'index',
            topic:'topic'
        }

        this.assign({
            links: links,
            catalog: catalog,
        });

        return this.display(template.default);
    }
}