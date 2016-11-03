'use strict';
/**
 * model
 */
export default class extends think.model.base {
    getPage(num = 1, listRows = 20) {
        //查询第 1 页数据，每页 10 条数据
        let id = this.getTableName() + '.id';

        return this.cache(10).page(num, listRows).select();
    }

    getCacheData() {
        return this.cache(10);
    }

    getOrder() {
        return this.order('sort_order asc');
    }

    getShow() {
        return this.where({status_is:'Y'});
    }

    getOrderList() {
        return this.getCacheData().getOrder().select();
    }

    findList(params) {
        return this.getCacheData().where(params).getShow().getOrder().select();
    }

    getList(num = 1) {
        this.field([this.getTableName() + '.*', this.getTablePrefix() + 'catalog.catalog_name as catalog_name']).join({
            table: 'catalog',
            join: 'left',
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

        return this.cache(10).order('title asc').select();
    }

    getStatusList(num) {
        let res = this.where({status_is:'Y'}).order('sort_order asc').select();

        return res;
    }

    getCount() {
        let res = this.cache(60).count();

        return res;
    }

    getTopicList(topicId) {
        let res = this.where({topic_id:topicId}).select();

        return res;
    }

    getNoGroupList() {
    // .where({catalog_id: '', user_id, topic_id})
        this.field([this.getTableName() + '.*', this.getTablePrefix() + 'catalog.catalog_name as catalog_name']).join({
            table: 'catalog',
            join: 'left',
            on: ['catalog_id', 'id']
        });

        return this.getPage(num);
    }

    searchTitleList(keywords, page) {
        this.field([this.getTableName() + '.*', this.getTablePrefix() + 'catalog.catalog_name as catalog_name']).join({
            table: 'catalog',
            join: 'left',
            on: ['catalog_id', 'id']
        });

        this.where({'title': ["like", "%" + keywords + "%"]});

        return this.getPage(page);
    }
}