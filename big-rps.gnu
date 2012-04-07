set terminal pngcairo background "#ffffff" fontscale 1.0 size 640, 500

set datafile separator ","

set title "Maximal Requests for Fast Queries with Big Results"
set xlabel "Concurrency Level"
set ylabel "Requests per Second"

#set ytics add ("" 120)

set yrange [0:60]

set output "big-rps1.png"

plot "php-fpm-big/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2

set yrange [0:300]

set output "big-rps2.png"

plot "php-fpm-big/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2

set output "big-rps3.png"

plot "php-fpm-big/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2

set output "big-rps4.png"

plot "php-fpm-big/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-big/slow.csv" using 1:2 with lines title "ngx_lua + lua-resty-mysql" lw 2

set output "big-rps5.png"

plot "php-fpm-big/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-big/slow.csv" using 1:2 with lines title "ngx_lua + lua-resty-mysql" lw 2, \
    "node-big/slow.csv" using 1:2 with lines title "nodejs + node-mysql + node-generic-pool" lw 2

set yrange [0:600]

set output "big-rps6.png"

plot "php-fpm-big/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-big/slow.csv" using 1:2 with lines title "ngx_lua + lua-resty-mysql" lw 2, \
    "node-big/slow.csv" using 1:2 with lines title "nodejs + node-mysql + node-generic-pool" lw 2, \
    "srcache-big/slow.csv" using 1:2 with lines title "ngx_srcache + ngx_memc" lw 2

