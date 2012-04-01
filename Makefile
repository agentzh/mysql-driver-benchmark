today=$(shell date +"%m%d")
now=$(shell date +"%H%M")
name=logs-$(today)-$(now)

.PHONY: all clean

all: ;

clean:
	rm -rf logs/

pack:
	tar --exclude='*~' --exclude='*.swp' --exclude='*.swo' -czvf $(name).tar.gz logs
	ls -lh $(name).tar.gz

check:
	@echo "=========== MySQL ==========="
	ps aux|grep mysqld|grep -v safe|grep -v grep
	@echo "=========== Nginx ==========="
	ps aux|grep nginx|grep -v grep
	@echo "=========== Watcher ========="
	ps aux|grep watch-|grep -v grep
	@echo "=========== API ============="
	curl localhost:8080/t

start-drizzle:
	cd ngx-drizzle-test && ./start

start-drizzle-lua:
	cd ngx-drizzle-lua-test && ./start

start-lua:
	cd ngx-lua-test && ./start

