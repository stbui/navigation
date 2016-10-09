'use strict';

import Base from './base.js';

export default class extends Base {

    async indexAction() {
        const linksModel = await this.model('links').getBlogList();
        const catalog = await this.model('catalog').order('sort_order asc').select();
        const linkCount = 2751;

        this.assign({
            links: linksModel,
            catalog: catalog,
            count: {
                link: linkCount,
            },
            update: think.datetime(),
            message: this.cookie('message'),
        });

        this.cookie('message', null)


        return this.display('blog');

    }
}