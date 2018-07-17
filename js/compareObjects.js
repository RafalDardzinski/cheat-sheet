// this function compares objects passed to it as arguments. Returns true if all passed objects have the same number of properties and equal key:value pairs

const compareObjects = (...args) => {
  // type checks
  if (args.length < 2) return false;
  if (args.find(arg => typeof arg !== 'object')) return false;

  // check if passed objects have the same number of properties
  if (args.find(arg => Object.keys(args[0]).length !== Object.keys(arg).length)) return false

  // check key: value pairs in every objects passed to the function
  for (key in args[0]) {
    const firstUnmatchedObject = args.find(arg => args[0][key] !== arg[key]);
    if (firstUnmatchedObject) return false;
    return true;
  }
}

module.exports = compareObjects;
