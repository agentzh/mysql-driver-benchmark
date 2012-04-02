today=$(shell date +"%m%d")
now=$(shell date +"%H%M")
name=logs-$(today)-$(now)

.PHONY: all clean bench-slow check pack \
	start-drizzle start-drizzle-lua start-lua timewait \
	upload-slow gen-slow

all: ;

clean:
	rm -rf *.png *.csv *.html

bench-slow:
	if [ -d logs-old/ ]; then rm -rf logs-old; fi
	if [ -d logs/ ]; then mv logs logs-old; fi
	mkdir -p logs
	./bench-slow > logs/slow.log 2>&1

pack:
	mv logs $(name)
	tar --exclude='*~' --exclude='*.swp' --exclude='*.swo' -czvf $(name).tar.gz $(name)
	ls -lh $(name).tar.gz

check:
	@echo "=========== MySQL ==========="
	-nice ps aux|grep mysqld|grep -v safe|grep -v grep
	@echo "=========== Nginx ==========="
	-nice ps aux|grep nginx|grep -v grep
	@echo "=========== Watcher ========="
	-nice ps aux|grep watch-|grep -v grep
	@echo "=========== API ============="
	-nice curl localhost:8080/t
	@echo
	@echo "=========== TIME_WAIT ========"
	-nice netstat -nt|grep :8080|grep TIME_WAIT|wc -l

start-drizzle:
	cd ngx-drizzle-test && ./start

start-drizzle-lua:
	cd ngx-drizzle-lua-test && ./start

start-lua:
	cd ngx-lua-test && ./start

timewait:
	nice netstat -nt|grep :8080|grep TIME_WAIT|wc -l

upload-slow:
	rsync -crv *.png *.html agentzh.org:~/www/agentzh/misc/nginx/bench/drizzle-slow-micro/

gen-slow:
	./parse-logs logs logs/slow.log > slow.csv
	R --no-save --slave < plot-slow.r --no-save -q
	tpage --define title='ngx_drizzle + ngx_rds_json on Amazon EC2 Micro' --define desc='All software runs in a single Micro instance. The MySQL Query is "select sleep(1)".' index.tt > slow.html

