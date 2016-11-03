'use strict';
/**
 * model
 */
export default class extends think.model.base {
    getPage(num = 1, listRows = 20) {
        //查询第 1 页数据，每页 10 条数据
        return this.page(num, listRows);
    }

    getCacheData() {
        return this.cache(60);
    }

    getOrder() {
        return this.order('sort_order asc');
    }

    getShow() {
        return this.where({top_is: 'Y'});
    }

    getList() {
        return this.getCacheData().getShow().getOrder().select();
    }

    findList(params) {
        return this.getCacheData().where(params).getShow().getOrder().select();
    }
}