/**
 * Dummy module for testing GitHub package publishing
 */

function greet(name = 'World') {
  return `Hello, ${name}!`;
}

function add(a, b) {
  return a + b;
}

module.exports = {
  greet,
  add,
};

