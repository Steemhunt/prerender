const prerender = require('prerender');
const server = prerender({
  port: 7777,
  workers: 8,
  pageLoadTimeout: 60 * 1000,
  chromeFlags: [ '--no-sandbox', '--headless', '--disable-gpu', '--hide-scrollbars' ],
});
server.start();
