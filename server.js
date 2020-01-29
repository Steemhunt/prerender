const prerender = require('prerender');
const server = prerender({
  port: 7777,
  workers: 1,
  pageLoadTimeout: 40 * 1000
});
server.use(require('prerender-memory-cache'))
server.start();
