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

    collectionAction() {

        return this.display();
    }


    async testAction() {
        const {type} = this.get();
        const filename = 'aliccc.json';
        const folder = think.ROOT_PATH + '/back';
        const path = folder + '/' + filename;

        let data = fs.readFileSync(path, 'utf-8');
        let linksModel = this.model('links');
        let newData = [];

        data = JSON.parse(data);

        for (let i = 0; i < data.length; i++) {
            let item = data[i];
            let links = await linksModel.where({link: item.link}).find();

            if (think.isEmpty(links)) {
                newData.push({
                    title: item.title,
                    link: item.link,
                    description: item.description,
                    status_is: 'N'
                });
            }
        }

        // 添加数据到数据库
        if (!think.isEmpty(newData)) {
            linksModel.addMany(newData);
        }

        this.json({count: newData.length,file:filename, data: newData});
    }
}