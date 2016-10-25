'use strict';

import Authorize from './authorize.js';

export default class extends Authorize {

    async indexAction() {
        let userInfo = await this.session('userInfo');
        if (think.isEmpty(userInfo)) {
        }

        this.display();
    }

    async registerAction() {
        const post = this.post();
        let {username, password} = {username: 'admin', password: 'admin'};
        password = think.md5(password);
        let result = await this.model('admin').thenAdd({username, password}, username);

        if (result.type == 'exist') {
            return this.fail(1001, '操作失败', post);
        }

        this.session('userInfo', result);
        this.success({username}, '操作成功');
    }


    async loginAction() {
        const params = this.param();
        let {username, password} = {username: 'admin', password: 'admin'};
        password = think.md5(password);
        let result = await this.model('admin').where({username, password}).find();

        if (think.isEmpty(result)) {
            return this.fail(1001, '操作失败', params);
        }

        this.session('userInfo', result);
        this.success({username}, '操作成功');
    }

    async logoutAction() {
        this.session('userInfo', null);

        if (this.isAjax()) {
            this.success({}, '操作成功');
        } else {
            return this.redirect('/my.html');
        }
    }

    async settingAction() {
        let userInfo = await this.session('userInfo');
        let {id} = userInfo;

        this.assign('data', userInfo);

        if (this.isPost()) {
            let post = this.post();
            this.model('admin').where({id}).update(post);
        }

        this.display();
    }

}