'use strict';

import Authorize from './authorize.js';

export default class extends Authorize {

    async indexAction() {

        return this.display();
    }

    async addAction() {
        let post = this.post();
        let {name} = post;

        let {id} = await this.session('userInfo');
        let create_time = (+new Date());
        post.create_time = create_time;
        post.user_id = id

        let result = await this.model('topic').add(post, {name});
        if (this.isAjax()) {
            // if (result.type == 'exist') {
            //     return this.fail(1001, '操作失败', post);
            // }

            return this.success(post, '操作成功');
        }

        // if (result.type == 'exist') {
        //     return this.fail(1001, '操作失败', post);
        // }

        return this.redirect('/my/index.html');
    }

    editAction() {
        let topicModel = this.model('topic');
        if (this.isPost()) {
            const params = this.post();
            let {id} = params;
            topicModel.where({id}).update(params);

            this.redirect('/my.html?id=' + id);
        } else {
            let {id} = this.get();
            topicModel = topicModel.where({id}).find();
        }


        this.assign({data: topicModel});
        return this.display();
    }

    async findAction() {
        const params = this.param();
        const topicModel = await this.model('topic').where(params).find();

        return this.success(topicModel, '操作成功');
    }

}