set terminal pngcairo background "#ffffff" fontscale 1.0 size 640, 500

set yrange [0:3000]

set datafile separator ","

set title "CPU Context Switches for Fast Queries with Big Results"
set xlabel "Concurrency Level"
set ylabel "Context Switches per Second"

#set ytics add ("" 120)

set output "big-cs1.png"

plot "php-fpm-big/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2

set output "big-cs2.png"

plot "php-fpm-big/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_rds_json" lw 2

set output "big-cs3.png"

plot "php-fpm-big/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_lua" lw 2

set output "big-cs4.png"

plot "php-fpm-big/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-big/slow.csv" using 1:6 with lines title "ngx_lua + lua-resty-mysql" lw 2

set output "big-cs5.png"

plot "php-fpm-big/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "drizzle-lua-big/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_lua" lw 2, \
    "lua-big/slow.csv" using 1:6 with lines title "ngx_lua + lua-resty-mysql" lw 2, \
    "node-big/slow.csv" using 1:6 with lines title "nodejs + node-mysql + node-generic-pool" lw 2

