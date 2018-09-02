const prerender = require('prerender');
const server = prerender({
  port: 7777,
  workers: 1
});
server.start();
