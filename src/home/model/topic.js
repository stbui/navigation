'use strict';
/**
 * model
 */
export default class extends think.model.base {
    getPage(num = 1, listRows = 20) {
        //查询第 1 页数据，每页 10 条数据
        return this.page(num, listRows);
    }

    getCatalogList() {
        return this.select();
    }

    getCacheData() {
        return this.cache(60);
    }

    getOrder() {
        return this.order('sort_order asc');
    }

    getShowTop() {
        return this.where({top_is: 'Y'});
    }

    getTopList() {
        return this.getCacheData().getShowTop().getOrder().select();
    }
}