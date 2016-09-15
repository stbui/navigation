'use strict';
/**
 * db config
 * @type {Object}
 */
export default {
  type: 'mysql',
  adapter: {
    mysql: {
      host: '127.0.0.1',
      port: '',
      database: 'navigation',
      user: 'root',
      password: 'root',
      prefix: 'ylmf_',
      encoding: 'utf8'
    },
    mongo: {

    }
  }
};