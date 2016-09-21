'use strict';

import Base from './base.js';

export default class extends Base {

    indexAction() {
        const config = this.model('config').select();
        this.assign('config', config);

        return this.display();
    }
}