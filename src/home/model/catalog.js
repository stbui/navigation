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

    getOrderList() {
        let res = this.cache(10).order('sort_order asc').select();

        return res;
    }

    getTopicList(topicId, userId) {
        let table = this.getTableName() + '.*';
        let status_is = this.getTableName() + '.status_is';
        // 关联表重命名
        let topicTablePrefix = this.getTablePrefix() + 'topic.';
        let topic_id = topicTablePrefix + 'id as topic_id';
        let topic_name = topicTablePrefix + 'name as topic_name';
        let topic_user_id = topicTablePrefix + 'user_id as topic_user_id';

        let res = this.field([table, topic_id, topic_name, topic_user_id]).join({
            table: 'topic',
            join: 'left',
            on: ['topic_id', 'id']
        });

        if (think.isEmpty(topicId)) {
            return res.where({[topicTablePrefix + 'user_id']: userId}).select();
        } else {
            return res.where({topic_id: topicId, [status_is]: 'Y'}).select();
        }
    }

}