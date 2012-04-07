var http = require('http');
var poolModule = require('generic-pool');
var pool = poolModule.Pool({
    name     : 'mysql',
    create   : function(callback) {
        var Client = require('mysql').Client;
        var c = new Client();
        c.user     = 'ngx_test';
        c.password = 'ngx_test';
        c.database = 'ngx_test';
        //c.connect();

        // parameter order: err, resource
        // new in 1.0.6
        callback(null, c);
    },
    destroy  : function(client) { client.end(); },
    max      : 1024,
    idleTimeoutMillis : 3000000,
    log : false
});

http.createServer(function (req, res) {
    pool.acquire(function(err, client) {
        //local query = "select sleep(1) as hello"
        //var query = "select * from test.comments order by id desc limit 1"
        //var query = "select * from test.comments order by id desc" // limit 1"
        var query = "select * from ngx_test.City order by ID limit 1000" // limit 1"
        client.query(query, [], function(err, rows, fields) {
            // return object back to pool
              if(err) {
                  //throw err;
                  console.log(err)
                    res.writeHead(500, {'Content-Type': 'text/plain'});
                    res.end();

                pool.release(client);
                  return;
              }

            res.writeHead(200, {'Content-Type': 'text/plain'});
            res.end(JSON.stringify(rows));

            pool.release(client);
        });
    });

}).listen(1337, '127.0.0.1');

console.log('Server running at http://127.0.0.1:1337/');

