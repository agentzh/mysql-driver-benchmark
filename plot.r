data <- read.csv(commandArgs(TRUE)[1])

png("rps-lowess-nginx.png", pointsize = 16)

plot(data$con, data$rps, xlab="concurrency", ylab="requests per second",
    main="Nginx Requests Per Second (LOWESS Chart)")

lines(lowess(data$con, data$rps), col="blue")

dev.off()

png("rps-nginx.png", pointsize = 16)

plot(data$con, data$rps, xlab="concurrency", ylab="requests per second",
    type="l", main="Nginx Requests Per Second")

dev.off()

png("time-nginx.png", pointsize = 16)

plot(data$con, data$time, xlab="concurrency", ylab="time (millisecons)",
    type="l", main="Nginx Average Response Time")

dev.off()

png("throughput-nginx.png", pointsize = 16)

plot(data$con, data$throughput, xlab="concurrency", ylab="Throughput (KBytes per second)",
    type="l", main="Nginx Throughput")

dev.off()

png("free-nginx.png", pointsize = 16)

plot(data$con, data$nginx_free, xlab="concurrency", ylab="Memory (MBytes)",
    type="l", main="Nginx Machine Free Memory (+ buffers/cache)")

dev.off()

png("vsz-nginx.png", pointsize = 16)

plot(data$con, data$nginx_vsz, xlab="concurrency", ylab="VSZ (MBytes)",
    type="l", main="Nginx Worker Memory Footprint (VSZ)")

dev.off()

png("rss-nginx.png", pointsize = 16)

plot(data$con, data$nginx_rss, xlab="concurrency", ylab="RSS (MBytes)",
    type="l", main="Nginx Worker Memory Footprint (RSS)")

#lines(data$con, data$nginx_rss, col="red")

dev.off()

png("cpu-nginx.png", pointsize = 16)

plot(data$con, data$nginx_cpu, xlab="concurrency", ylab="CPU (%)",
    type="l", main="Nginx Worker CPU Usage")

dev.off()

png("cpu-mysql.png", pointsize = 16)

plot(data$con, data$mysql_cpu, xlab="concurrency", ylab="CPU (%)",
    type="l", main="MySQL CPU Usage")

dev.off()

png("rss-mysql.png", pointsize = 16)

plot(data$con, data$mysql_rss, xlab="concurrency", ylab="RSS (MBytes)",
    type="l", main="MySQL Memory Footprint (RSS)")

dev.off()

png("vsz-mysql.png", pointsize = 16)

plot(data$con, data$mysql_vsz, xlab="concurrency", ylab="VSZ (MBytes)",
    type="l", main="MySQL Memory Footprint (VSZ)")

dev.off()

png("threads-mysql.png", pointsize = 16)

plot(data$con, data$mysql_threads, xlab="concurrency", ylab="Threads",
    type="l", main="MySQL Thread Count")

dev.off()

