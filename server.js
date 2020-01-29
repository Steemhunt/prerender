const prerender = require('prerender');
const server = prerender({
  port: 7777,
  workers: 256,
  pageLoadTimeout: 40 * 1000
});
server.start();
