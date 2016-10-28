'use strict';

import Base from './base.js';

export default class extends Base {

    async indexAction() {
        const links = await this.model('links').countSelect();
        this.assign({
            links: links,
            count: {
                link: links.count,
                site: 10,
                day: 0,
                yesterday: 0
            }
        });

        return this.display();
    }
}