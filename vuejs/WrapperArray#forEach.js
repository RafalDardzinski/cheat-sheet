/*
 *  This is simple forEach polyfill for vue.js test utils WrapperArray class.
*/

import { WrapperArray } from '@vue/test-utils';

WrapperArray.prototype.forEach = function (func) {
  for (let index = 0; index < this.length; index++) {
    const wrapper = this.at(index);
    func(wrapper, index, this);
  }
};
