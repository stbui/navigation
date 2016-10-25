'use strict';

import Base from './base.js';
import fs from 'fs';


export default class extends Base {

    indexAction() {
        const topicModel = this.model('topic').where({top_is:'Y'}).select();
        const linksModel = this.model('links').select();
        const linksCount = this.model('links').count();

        this.assign({
            topic: topicModel,
            links: linksModel,
            catalog:[],
            count: {
                link: linksCount,
            },
            message: this.cookie('message'),
            update: think.datetime()
        });

        return this.display();
    }

    viewAction() {
        let get = this.get();
        let topic_id = get.id;

        if(think.isEmpty(topic_id)) {
            topic_id = 1;
        }

        const topicModel = this.model('topic').where({id:topic_id}).find();
        const linksModel = this.model('links').where({topic_id: topic_id}).select();
        const linksCount = this.model('links').count();

        this.assign({
            topic: topicModel,
            catalog:[],
            links: linksModel,
            count: {
                link: linksCount,
            },
            message: this.cookie('message'),
            update: think.datetime()
        });

        return this.display();
    }

}