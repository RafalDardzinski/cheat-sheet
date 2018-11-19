/**
 * This is basic implementation of stack concept in ES6 classes using WeakMap() to mimic private properties.
 */

const _stack = new WeakMap();

class Stack {
  constructor() {
    _stack.set(this, []);
  }

  push(val) {
    _stack.get(this).push(val);
  }

  pop() {
    const stack = _stack.get(this);
    if (!stack.length)
      throw new Error('Stack is empty');
    return stack.pop();
  }

  peek() {
    const stack = _stack.get(this);
    if (!stack.length)
      throw new Error('Stack is empty');
    return stack.slice(-1)[0];
  }

  get count() {
    return _stack.get(this).length;
  }
}
