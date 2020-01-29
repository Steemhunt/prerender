const prerender = require('prerender');
const server = prerender({
  port: 7777,
  pageLoadTimeout: 300 * 1000, // 5 minutes
  chromeFlags: [ '--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars' ]
});
server.use(require('prerender-memory-cache'))
server.start();
