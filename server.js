const prerender = require('prerender');
const server = prerender({
  port: 80,
  workers: 1
});
server.start();
