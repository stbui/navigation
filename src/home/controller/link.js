'use strict';

import Authorize from './authorize.js';

export default class extends Authorize {

    indexAction() {

        return this.display();
    }

    async addAction() {

        return this.display();
    }

    editAction() {
        const params = this.param();
        // 链接id, 收藏夹id
        const {id, topic} = params;
        let links = this.model('links').where({id});
        // const catalog = this.model('catalog').order('sort_order asc').select();
        // 收藏夹下的分组
        // todo topic 没有怎么处理
        const catalogModel = this.model('catalog').getTopicList(topic);

        if (this.isPost()) {
            params.topic_id = topic;
            links.update(params);
            return this.redirect(`/my/index.html?id=${topic}`);
        } else {
            links = links.find();
        }

        this.navType = topic;

        this.assign({
            data: links,
            catalog: catalogModel
        });

        return this.display();
    }

    deleteAction() {
        const {id} = this.param();
        this.model('links').where({id}).update({status_is: 'N'});

        this.redirect('/admin/link.html');
    }

}