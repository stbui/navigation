'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    async indexAction() {
        const config =await this.model('config').select();
        this.assign('config',config);

        // this.json(config)

        return this.display();
    }
}