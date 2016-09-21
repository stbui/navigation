'use strict';
/**
 * logic
 * @param  {} []
 * @return {}     []
 */
export default class extends think.logic.base {
    /**
     * index action logic
     * @return {} []
     */
    indexAction() {

    }

    recommendAction() {
        this.allowMethods = "post";

        this.rules = {
            title: '',
            link: '',
            catalog_id: '',
            description: ''
        }
    }
}