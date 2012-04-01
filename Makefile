today=$(shell date +"%m%d")
now=$(shell date +"%H%M")
name=logs-$(today)-$(now)

.PHONY: all clean bench check pack start-drizzle start-drizzle-lua start-lua

all: ;

clean:
	rm -rf logs/

bench:
	if [ -d logs-old/ ]; then rm -rf logs-old; fi
	mv logs logs-old
	./bench-slow

pack:
	tar --exclude='*~' --exclude='*.swp' --exclude='*.swo' -czvf $(name).tar.gz logs
	ls -lh $(name).tar.gz

check:
	@echo "=========== MySQL ==========="
	-ps aux|grep mysqld|grep -v safe|grep -v grep
	@echo "=========== Nginx ==========="
	-ps aux|grep nginx|grep -v grep
	@echo "=========== Watcher ========="
	-ps aux|grep watch-|grep -v grep
	@echo "=========== API ============="
	-curl localhost:8080/t
	@echo
	@echo "=========== TIME_WAIT ========"
	-netstat -nt|grep :8080|grep TIME_WAIT|wc -l

start-drizzle:
	cd ngx-drizzle-test && ./start

start-drizzle-lua:
	cd ngx-drizzle-lua-test && ./start

start-lua:
	cd ngx-lua-test && ./start

