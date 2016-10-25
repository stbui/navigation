前端导航大全
----------

git clone
```bash
https://github.com/stbui/navigation
```

安装依赖并启动
```bash
npm install
```

导入sql到MySQL数据库，然后修改项目数据库配置文件
```bash
src/common/config/db.js
```

```javascript
mysql: {
      host: '127.0.0.1',
      port: '',
      database: 'navigation',
      user: 'root',
      password: 'root',
      prefix: 'nav_',
      encoding: 'utf8'
}
```

```bash
npm run start
```

[前端导航大全](back/favourite.md)



