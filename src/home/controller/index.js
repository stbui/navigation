'use strict';

import Base from './base.js';
import fs from 'fs';


export default class extends Base {

    async indexAction() {
        // const links = await this.model('links').getStatusList();
        // const catalog = await this.model('catalog').getOrderList();
        // const linkCount = await this.model('links').getCount();
        // const topicModel = this.model('topic').select();
        //
        // this.assign({
        //     links: links,
        //     catalog: catalog,
        //     topic:topicModel,
        //     count: {
        //         link: linkCount,
        //     },
        //     update: think.datetime(),
        //     message: this.cookie('message'),
        // });
        //
        // this.cookie('message', null)
        //
        //
        //
        //
        //
        // return this.display();


        const topicModel =await this.model('topic').getCatalogList();
        const catalogModel = await this.model('catalog').where({topic_id:15}).select();

        this.assign({
            links: [],
            catalog: catalogModel,
            topic:topicModel,
            count: {
                link: [],
            },
            update: think.datetime(),
            message: this.cookie('message'),
        });

        return this.display();
        // return this.success(linksModel);
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

    addAction() {
        const params = this.get();
        const {url,name,description,imgUrl} = params;

        this.assign('data', params);
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