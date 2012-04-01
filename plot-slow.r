slow <- read.csv("slow.csv")

png("rps-drizzle-slow-micro-lowess.png", pointsize = 15)

plot(slow$con, slow$rps, xlab="concurrency", ylab="requests per second",
    main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (RPS LOWESS Chart)")

lines(lowess(slow$con, slow$rps), col="blue")

dev.off()

png("rps-drizzle-slow-micro.png", pointsize = 15)

plot(slow$con, slow$rps, xlab="concurrency", ylab="requests per second",
    type="l", main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (RPS Line Chart)")

dev.off()

png("vsz-drizzle-slow-micro.png", pointsize = 15)

plot(slow$con, slow$nginx_vsz, xlab="concurrency", ylab="Nginx Worker VSZ (in MBytes)",
    type="l", main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (Nginx VSZ Line Chart)")

dev.off()

png("rss-drizzle-slow-micro.png", pointsize = 15)

plot(slow$con, slow$nginx_rss, xlab="concurrency", ylab="Nginx Worker RSS (in MBytes)",
    type="l", main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (Nginx RSS Line Chart)")

#lines(slow$con, slow$nginx_rss, col="red")

dev.off()

png("cpu-drizzle-slow-micro.png", pointsize = 15)

plot(slow$con, slow$nginx_cpu, xlab="concurrency", ylab="Nginx Worker CPU Usage (in %)",
    type="l", main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (Nginx CPU Line Chart)")

#lines(slow$con, slow$nginx_rss, col="red")

dev.off()

