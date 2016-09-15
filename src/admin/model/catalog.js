'use strict';
/**
 * model
 */
export default class extends think.model.base {
    getPage(num, listRows = 20) {
        //查询第 1 页数据，每页 10 条数据
        let id = this.getTableName() + '.id';

        return this.cache(10).page(num, listRows).where({[id]: {">": 20}}).select();
    }

}