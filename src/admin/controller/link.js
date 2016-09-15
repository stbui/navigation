'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    const {num} = this.get();
    const links =await this.model('links').getList();

    // this.json(links);


    this.assign('data',links);
    return this.display();
  }
}