const prerender = require('prerender');
const server = prerender({
  port: 7777,
  pageLoadTimeout: 40 * 1000,
  chromeFlags: [ '--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars' ]
});
server.use(require('prerender-memory-cache'))
server.start();
