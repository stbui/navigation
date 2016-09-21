'use strict';

import Base from './base.js';
import fs from 'fs';

export default class extends Base {

    async indexAction() {
        const folder = think.ROOT_PATH + '/back';

        let res = [];
        let files = fs.readdirSync(folder);

        files.forEach(file=> {
            let pathname = folder + '/' + file;
            let size = (fs.statSync(pathname).size / 1024).toFixed(2) + 'kb';
            let name = file.replace(/.json/g, '');
            res.push({
                name: name,
                size: size
            });
        });

        this.assign('data', res);

        return this.display();
    }

    async backupAction() {
        const folder = think.ROOT_PATH + '/back';
        const filename = think.datetime(new Date, 'YYYYMMDDHHmmss');
        const path = folder + '/' + filename + '.json';

        if (this.isPost()) {
            const links = await this.model('links').select();
            const catalog = await this.model('catalog').select();

            let data = {
                links: links,
                catalog: catalog
            }

            if (!fs.existsSync(folder)) {
                fs.mkdirSync(folder);
            }
            fs.writeFileSync(path, JSON.stringify(data), 'utf-8');

            this.redirect('/admin/data');
        }
    }

    restore() {

    }

}