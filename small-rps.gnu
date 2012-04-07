set terminal pngcairo background "#ffffff" fontscale 1.0 size 640, 500

set datafile separator ","

set title "Maximal Requests for Fast Queries with Small Results"
set xlabel "Concurrency Level"
set ylabel "Requests per Second"

#set ytics add ("" 120)

set yrange [0:1000]

set output "small-rps1.png"

plot "php-fpm-small/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2

set yrange [0:7000]

set output "small-rps2.png"

plot "php-fpm-small/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2

set output "small-rps3.png"

plot "php-fpm-small/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2

set output "small-rps4.png"

plot "php-fpm-small/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-small/slow.csv" using 1:2 with lines title "ngx_lua + lua-resty-mysql" lw 2

set output "small-rps5.png"

plot "php-fpm-small/slow.csv" using 1:2 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-small/slow.csv" using 1:2 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-small/slow.csv" using 1:2 with lines title "ngx_lua + lua-resty-mysql" lw 2, \
    "node-small/slow.csv" using 1:2 with lines title "nodejs + node-mysql + node-generic-pool" lw 2

