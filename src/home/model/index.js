'use strict';
/**
 * model
 */
export default class extends think.model.base {
    getPage(num = 1, listRows = 20) {
        //查询第 1 页数据，每页 10 条数据
        let id = this.getTableName() + '.id';

        return this.page(num, listRows).select();
    }

    getList(num = 1) {
        let res = this.field([this.getTableName() + '.*', this.getTablePrefix() + 'catalog.catalog_name as catalog_name']).join({
            table: 'catalog',
            join: 'left',
            on: ['catalog_id', 'id']
        });

        return this.getPage(num);
    }
}