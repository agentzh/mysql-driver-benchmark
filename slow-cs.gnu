set terminal pngcairo background "#ffffff" fontscale 1.0 size 640, 500
set yrange [0:8500]

set datafile separator ","

set title "CPU Context Switches for Slow Queries"
set xlabel "Concurrency Level"
set ylabel "Context Switches per Second"

set output "slow-cs1.png"

plot "php-fpm-slow/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2

set output "slow-cs2.png"

plot "php-fpm-slow/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-slow/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_rds_json" lw 2

set output "slow-cs3.png"

plot "php-fpm-slow/slow.csv" using 1:6 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-slow/slow.csv" using 1:6 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "lua-slow/slow.csv" using 1:6 with lines title "ngx_lua + lua-resty-mysql" lw 2

