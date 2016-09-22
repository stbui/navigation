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

    async collectionAction() {
        let linksModel = this.model('links');

        const filename = 'data';
        const folder = think.ROOT_PATH + '/back';
        const path = folder + '/' + filename + '.json';

        let data = fs.readFileSync(path, 'utf-8');
        data = JSON.parse(data);

        var newData = [];
        for (let i = 0; i < data.length; i++) {
            let item = data[i];

            var img = item.icon;
            if (!img) {
                img = '';
            }
            let links = await linksModel.where({link: item.url}).find();

            if (think.isEmpty(links)) {
                newData.push({
                    title: item.name,
                    link: item.url,
                    description: item.des,
                    image_link: img,
                    status_is: 'N'
                });
            } else {
                // newData.push({
                //     title: item.name,
                //     link: item.url,
                //     description: item.des,
                //     image_link: img,
                //     status_is: 'N'
                // });
            }
        }

        // this.model('links').addMany(newData);

        this.json(newData);
    }

    restore() {

    }

}