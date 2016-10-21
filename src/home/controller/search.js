'use strict';

import Authorize from './authorize.js';

export default class extends Authorize {

    async indexAction() {
        const {keywords, type, page} = this.param();
        const links = this.model('links');
        let data;
        switch (type) {
            case 'catalog':
                data = links.searchCategoryList(keywords, page);
                break;
            case 'status':
                data = links.searchStatusList(keywords, page);
                break;
            default:
                data = links.searchTitleList(keywords, page);
                break;
        }

        this.assign({
            links: data,
            type: type,
            keywords:keywords
        });

        return this.display();
    }

}