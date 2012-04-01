slow <- read.csv("slow.csv")

png("drizzle-slow-micro-lowess.png", pointsize = 15)

plot(slow$con, slow$rps, xlab="concurrency", ylab="requests per second",
    main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (LOWESS Chart)")

lines(lowess(slow$con, slow$rps), col="blue")

dev.off()

png("drizzle-slow-micro.png", pointsize = 15)

plot(slow$con, slow$rps, xlab="concurrency", ylab="requests per second",
    type="l", main="ngx_drizzle/ngx_rds_json on Amazon EC2 Micro",
    sub="MySQL Query \"select sleep(1)\" (Line Chart)")

dev.off()

