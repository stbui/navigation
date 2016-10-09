'use strict';
/**
 * model
 */
export default class extends think.model.base {
    getPage(num = 1, listRows = 20) {
        //查询第 1 页数据，每页 10 条数据
        let id = this.getTableName() + '.id';

        return this.page(num, listRows).order('id desc').select();
    }

    getList(num = 1) {
        this.field().join({
            table: 'catalog',
            join: 'right',
            on: ['catalog_id', 'id']
        });

        return this.getPage(num);
    }

    getBlogList() {
        this.field([this.getTableName() + '.id', this.getTableName() + '.title', this.getTableName() + '.link', this.getTableName() + '.image_link', this.getTableName() + '.description', this.getTablePrefix() + 'catalog.catalog_name as catalog_name']).join({
            table: 'catalog',
            join: 'left',
            on: ['catalog_id', 'id']
        }).where({'catalog_id': 607});

        return this.order('title asc').select();
    }
}