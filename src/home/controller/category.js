'use strict';

import Base from './base.js';

export default class extends Base {

    __before() {
        this.navType = 'category';
    }

    indexAction() {

    }

    async findAction() {
        const params = this.param();
        const result = await this.model('catalog').where(params).find();

        return this.success(result, '操作成功');
    }

    async addAction() {
        const params = this.param();
        const {catalog_name} = params;
        const result = await this.model('catalog').thenAdd(params, {catalog_name});

        if (result.type == 'exist') {
            return this.fail(1001, '已经添加过了', params);
        }

        return this.success(params, '添加成功');
    }

    async editAction() {
        const params = this.param();
        const {id} = params;

        let catalogModel = this.model('catalog');
        if (this.isPost()) {
            catalogModel.where({id}).update(params);
            return this.success(params, '操作成功');
        } else {
            return this.fail(1001, message, '非法操作');
        }
    }

    async delAction() {
        const {id} = this.param();
        const result = await this.model('catalog').where({id}).update({status_is: 'N'});

        return this.success(result);
    }
}