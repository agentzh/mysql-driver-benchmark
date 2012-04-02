slow <- read.csv("slow.csv")

png("rps-lowess-nginx.png", pointsize = 15)

plot(slow$con, slow$rps, xlab="concurrency", ylab="requests per second",
    main="Nginx Requests Per Second (LOWESS Chart)")

lines(lowess(slow$con, slow$rps), col="blue")

dev.off()

png("rps-nginx.png", pointsize = 15)

plot(slow$con, slow$rps, xlab="concurrency", ylab="requests per second",
    type="l", main="Nginx Requests Per Second")

dev.off()

png("vsz-nginx.png", pointsize = 15)

plot(slow$con, slow$nginx_vsz, xlab="concurrency", ylab="VSZ (MBytes)",
    type="l", main="Nginx Worker Memory Footprint (VSZ)")

dev.off()

png("rss-nginx.png", pointsize = 15)

plot(slow$con, slow$nginx_rss, xlab="concurrency", ylab="RSS (MBytes)",
    type="l", main="Nginx Worker Memory Footprint (RSS)")

#lines(slow$con, slow$nginx_rss, col="red")

dev.off()

png("cpu-nginx.png", pointsize = 15)

plot(slow$con, slow$nginx_cpu, xlab="concurrency", ylab="CPU (%)",
    type="l", main="Nginx Worker CPU Usage")

dev.off()

png("cpu-mysql.png", pointsize = 15)

plot(slow$con, slow$mysql_cpu, xlab="concurrency", ylab="CPU (%)",
    type="l", main="MySQL CPU Usage")

dev.off()

png("rss-mysql.png", pointsize = 15)

plot(slow$con, slow$mysql_rss, xlab="concurrency", ylab="RSS (MBytes)",
    type="l", main="MySQL Memory Footprint (RSS)")

dev.off()

png("vsz-mysql.png", pointsize = 15)

plot(slow$con, slow$mysql_vsz, xlab="concurrency", ylab="VSZ (MBytes)",
    type="l", main="MySQL Memory Footprint (VSZ)")

dev.off()

png("threads-mysql.png", pointsize = 15)

plot(slow$con, slow$mysql_threads, xlab="concurrency", ylab="Threads",
    type="l", main="MySQL Thread Count")

dev.off()

