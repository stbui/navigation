'use strict';

export default class extends think.controller.base {
    async __before() {
        let userInfo = await this.session('userInfo');
        if (think.isEmpty(userInfo)) {
            this.redirect('/login/index.html');
        } else {

        }

        think.log(userInfo, 'session');

        let {id, username} = userInfo;
        const topicModel = this.model('topic').where({user_id: id}).select();
        this.navType = 'my';

        this.assign({
            username,
            menu: topicModel
        });
    }
}