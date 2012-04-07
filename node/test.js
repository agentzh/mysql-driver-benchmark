var http = require('http');
var poolModule = require('generic-pool');
var pool1 = poolModule.Pool({
    name     : 'mysql',
    create   : function(callback) {
        var Client = require('mysql').Client;
        var c = new Client();
        c.host = "10.211.162.185";
        c.user     = 'ngx_test';
        c.password = 'ngx_test';
        c.database = 'world';
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

var pool2 = poolModule.Pool({
    name     : 'mysql',
    create   : function(callback) {
        var Client = require('mysql').Client;
        var c = new Client();
        c.host = "10.211.93.139";
        c.user     = 'ngx_test';
        c.password = 'ngx_test';
        c.database = 'world';
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

var pool3 = poolModule.Pool({
    name     : 'mysql',
    create   : function(callback) {
        var Client = require('mysql').Client;
        var c = new Client();
        c.host = "10.192.15.221";
        c.user     = 'ngx_test';
        c.password = 'ngx_test';
        c.database = 'world';
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

var pool4 = poolModule.Pool({
    name     : 'mysql',
    create   : function(callback) {
        var Client = require('mysql').Client;
        var c = new Client();
        c.host = "10.210.187.58";
        c.user     = 'ngx_test';
        c.password = 'ngx_test';
        c.database = 'world';
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

var pools = [pool1, pool2, pool3, pool4];

http.createServer(function (req, res) {
    var i = Math.floor((Math.random()*4));
    //console.log(i);
    var pool = pools[i];

    pool.acquire(function(err, client) {
        //var query = "select sleep(1) as hello"
        //var query = "select sleep(1)"
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

}).listen(8080);

console.log('Server running at http://127.0.0.1:8080/');

