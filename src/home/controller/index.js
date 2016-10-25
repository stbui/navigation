'use strict';

import Base from './base.js';
import fs from 'fs';

export default class extends Base {

     async indexAction() {
        let get = this.get();
        let topic_id = get.id;

        if (think.isEmpty(topic_id)) {
            topic_id = 1;
        }

        const topicModel =  this.model('topic').getTopList();
        const catalogModel =  this.model('catalog').getTopicIdList({topic_id: topic_id});
        const linksModel =  this.model('links').getCacheData().where({topic_id: topic_id}).getOrder().select();
        const linksCount = await this.model('links').getCount();

        this.assign({
            topic: topicModel,
            catalog: catalogModel,
            links: linksModel,
            count: {
                link: linksCount,
            },
            update: think.datetime(),
            message: this.cookie('message'),
        });

        this.cookie('message', null)
        return this.display();
    }

    async getlinksAction() {
        let post = this.post();
        let {topic_id, catalog_id} = post;
        let linksmodel = this.model('links');

        if (catalog_id == 0) {
            linksmodel = await linksmodel.where({topic_id}).select();
        } else {
            linksmodel = await linksmodel.where({topic_id, catalog_id}).select();
        }

        return this.success(linksmodel, '操作成功');
    }

    async recommendAction() {
        const post = this.post();
        const result = await this.model('links').thenAdd(post, {link: post.link});

        if (result.type == 'exist') {
            this.cookie('message', '来迟一步，系统已有该网址了');
        } else {
            this.cookie('message', '非常感谢您的推荐，稍后管理员会审核您的网址');
        }

        this.redirect('/index.html');
        // this.redirect('/my.html');
    }

    async downloadAction() {
        const {type} = this.get();
        const linksModel = await this.model('links').field('title,link').order('title asc').select();

        const folder = think.ROOT_PATH + '/back';
        const filename = 'favourite';
        let path = path = folder + '/' + filename + '.json';

        let data = linksModel;

        if (!fs.existsSync(folder)) {
            fs.mkdirSync(folder);
        }


        switch (type) {
            case 'html':
                data = this.htmlFile(data);
                path = folder + '/' + filename + '.html';
                this.download(path, filename + '.html');
                break;
            case 'markdown':
                data = this.markdownFile(data);
                path = folder + '/' + filename + '.md';
                this.download(path, filename + '.md');
                break;
            case 'json':
                data = JSON.stringify(data);
                path = folder + '/' + filename + '.json';
                this.download(path, filename + '.json');
                break;
            default:
                data = JSON.stringify(data);
                path = folder + '/' + filename + '.json';
                this.download(path, filename + '.json');
                break;
        }

        fs.writeFileSync(path, data, 'utf-8');
    }

    collectAction() {
        return this.display();
    }

    async addAction() {
        //todo: 验证是否登陆

        const params = this.get();
        let {url, name, description, imgUrl} = params;

        if(this.isPost()) {
            let post = this.post();
            let {link} = post;

            // todo: 不是自己添加的，应该复制对方的链接
            let userInfo = await this.session('userInfo');
            post.user_id = userInfo.id;

            let result = await this.model('links').thenAdd(post, {link});
            if(result.type == 'exist') {
                result = await this.model('links').where({link}).update(post);
                if(result) {
                    this.end('<script>window.close();</script>');
                    // return this.success(post,'修改成功');
                } else  {
                    return this.fail(1001, '提交失败', post);
                }
            }

            // return this.success(post,'提交成功');
            this.end('<script>window.close();</script>');
        }

        let userInfo = await this.session('userInfo');
        let user_id = userInfo.id;

        const topicModel = this.model('topic').where({user_id: user_id}).select();

        this.assign({
            data: params,
            topic: topicModel
        });

        return this.display();
    }


    htmlFile(data) {
        let str = ``;

        data.forEach(value=> {
            str += `<div>${value.title} : <a href="${value.link}" target="_blank">${value.link}</a></div>\r\n`;
        });

        return str;
    }

    markdownFile(data) {
        let str = `
网址名称 | 网址链接
----|----
`;

        data.forEach(value=> {
            str += `${value.title} | ${value.link}\r\n`;
        });

        return str;
    }
}