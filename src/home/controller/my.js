'use strict';

import Authorize from './authorize.js';

export default class extends Authorize {

    async indexAction() {
        let {id} = this.get();
        let userInfo = await this.session('userInfo');

        this.navType = id;
        let catalogModel;

        catalogModel = await this.model('catalog').getTopicList(id, userInfo.id);

        this.assign({
            catalog: catalogModel,
        });
        return this.display();
    }

    /*
     * 查询收藏夹对于的链接
     * */
    async typeAction() {
        let {catalog_id, topic_id} = this.post();

        if (think.isEmpty(topic_id)) {
            topic_id = '';
        }

        let topicUserId;
        let topicModel = await this.model('topic').where({id: topic_id}).find();
        if (think.isEmpty(topicModel)) {
            // 当前登陆用户
            topicUserId = await this.session('userInfo');
            topicUserId = topicUserId.id;
        } else {
            topicUserId = topicModel.user_id;
        }

        think.log(`topicUserId: ${topicUserId}`, 'result');

        let linksModel = this.model('links');
        let {user_id} = {user_id: topicUserId};
        if (catalog_id == 0) {
            // 全部
            linksModel = await linksModel.where({user_id, topic_id}).select();
        } else if (catalog_id == -1) {
            // 未分组
            linksModel = await linksModel.where({catalog_id: '', user_id, topic_id}).getStatusList();
        } else {
            // 已分组
            linksModel = await linksModel.where({catalog_id: catalog_id, user_id}).getStatusList();
        }

        return this.success(linksModel);
    }

    /*
     * 新增链接
     * */
    async recommendAction() {
        const params = this.post();
        const {link} = params;

        // 当前用户
        let userInfo = await this.session('userInfo');
        params.user_id = userInfo.id;

        const result = await this.model('links').thenAdd(params, {link});

        if (result.type == 'exist') {
            return this.fail(1001, '操作失败', params);
        }

        return this.success(params, '操作成功');
    }

    /*
     * 新增分类
     * */
    async catalogAction() {
        const params = this.param();
        const {catalog_name} = params;
        const result = await this.model('catalog').thenAdd(param, {catalog_name});

        let message = '添加成功';
        if (result.type == 'exist') {
            message = '您已经添加过了，换个试试';
            return this.fail(1001, message, params);
        }

        return this.success(params, message);
    }
}