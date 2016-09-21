'use strict';

import Base from './base.js';


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
}