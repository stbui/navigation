'use strict';

import Base from './base.js';
import fs from 'fs';


export default class extends Base {

    async indexAction() {
        const links = await this.model('links').order('sort_order asc').select();
        const catalog = await this.model('catalog').order('sort_order asc').select();
        const linkCount = await this.model('links').count();

        this.assign({
            links: links,
            catalog: catalog,
            count: {
                link: linkCount,
            },
            update: think.datetime(),
            message: this.cookie('message'),
        });

        this.cookie('message', null)


        return this.display('default');
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
    }


    async downloadAction() {
        const {type} = this.get();
        const linksModel = await this.model('links').field('title,link').select();

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
                fs.writeFileSync(think.ROOT_PATH+'/README.md', data, 'utf-8');
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

    htmlFile(data) {
        let str = ``;

        data.forEach(value=> {
            str += `${value.title} : <a href="${value.link}" target="_blank">${value.link}</a>\r\n`;
        });

        return str;
    }

    markdownFile(data) {
        let str = `
网址名称 | 网址链接
:----:|:----:
`;

        data.forEach(value=> {
            str += `${value.title} | ${value.link}\r\n`;
        });

        return str;
    }
}