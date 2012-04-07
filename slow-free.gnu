set terminal pngcairo background "#ffffff" fontscale 1.0 size 640, 500

set yrange [1000:1750]

set datafile separator ","

set title "Free Memory for Slow Queries"
set xlabel "Concurrency Level"
set ylabel "MBytes"

#set ytics add ("" 120)

set output "slow-free1.png"

plot "php-fpm-slow2/slow.csv" using 1:7 with lines title "php-fpm + php-mysql" lw 2

set output "slow-free2.png"

plot "php-fpm-slow2/slow.csv" using 1:7 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-slow/slow.csv" using 1:7 with lines title "ngx_drizzle + ngx_rds_json" lw 2

set output "slow-free3.png"

plot "php-fpm-slow2/slow.csv" using 1:7 with lines title "php-fpm + php-mysql" lw 2, \
    "drizzle-slow/slow.csv" using 1:7 with lines title "ngx_drizzle + ngx_rds_json" lw 2, \
    "lua-slow/slow.csv" using 1:7 with lines title "ngx_lua + lua-resty-mysql" lw 2

