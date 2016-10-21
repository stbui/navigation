'use strict';

import Base from './base.js';
import fs from 'fs';


export default class extends Base {

    indexAction() {
        return this.display();
    }

    async signinAction() {
        const params = this.post();
        let {username, password} = params;
        let data = {
            username,
            password: think.md5(password)
        }

        think.log(data, 'login');
        let result = await this.model('admin').where(data).find();

        if (think.isEmpty(result)) {
            return this.fail(1001, '操作失败', params);
        }

        await this.session('userInfo', result);
        // return this.success({username}, '操作成功');

        this.redirect('/my.html');
    }

    async registerAction() {
        const post = this.post();
        let {username, password} = post;
        let data = {
            username,
            password: think.md5(password),
            create_time: (+new Date()),
        }

        let result = await this.model('admin').thenAdd(data, {username, password});
        if (result.type == 'exist') {
            return this.fail(1001, '操作失败', post);
        }

        this.session('userInfo', result);
        // return this.success({username, password}, '操作成功');

        this.redirect('/my.html');
    }

    async logoutAction() {
        await this.session('userInfo', null);

        if (this.isAjax()) {
            this.success({}, '操作成功');
        } else {
            return this.redirect('/my.html');
        }
    }
}