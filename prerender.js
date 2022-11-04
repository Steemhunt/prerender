const prerender = require('prerender');
const server = prerender({
  port: 7777,
  pageLoadTimeout: 40 * 1000, // 40 seconds
  chromeFlags: chromeFlags: [ '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars', '--blink-settings=imagesEnabled=false', '--crash-dumps-dir=/dev/null' ]
});
server.use(require('prerender-memory-cache'))
server.start();
