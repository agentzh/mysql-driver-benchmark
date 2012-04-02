today=$(shell date +"%m%d")
now=$(shell date +"%H%M")
name=logs-$(today)-$(now)

.PHONY: all clean bench-slow check pack \
	start-drizzle start-drizzle-lua start-lua timewait \
	upload-drizzle-slow gen-drizzle-slow \
	upload-drizzle-lua-slow gen-drizzle-lua-slow \
	upload-lua-slow gen-lua-slow \
	upload-drizzle-slow-small

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
	-nice ps -eLf|grep mysqld|grep -v safe|grep -v grep|wc -l
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
	nice netstat -nt|grep :3306|grep TIME_WAIT|wc -l

upload-drizzle-slow:
	rsync -crv *.png *.html agentzh.org:~/www/agentzh/misc/nginx/bench/drizzle-slow-micro/

upload-drizzle-slow-small:
	rsync -crv *.png *.html agentzh.org:~/www/agentzh/misc/nginx/bench/drizzle-slow-small/

upload-drizzle-lua-slow:
	rsync -crv *.png *.html agentzh.org:~/www/agentzh/misc/nginx/bench/drizzle-lua-slow-micro/

upload-lua-slow:
	rsync -crv *.png *.html agentzh.org:~/www/agentzh/misc/nginx/bench/lua-slow-micro/

gen-drizzle-slow:
	./parse-logs logs logs/slow.log > slow.csv
	R --no-save --slave < plot.r --no-save -q --args slow.csv
	tpage --define title='ngx_drizzle + ngx_rds_json on Amazon EC2 Micro' \
	    --define desc='All software runs in a single Micro instance.' \
	    --define or_ver=1.0.11.28 \
	    --define os='Amazon Linux AMI release 2011.09 (x86_64)' \
	    --define ngx_config=ngx-drizzle-test/conf/nginx.conf \
	    --define mysql_ver=5.1.61 \
	    --define time="`date`" \
	    index.tt > slow.html

gen-drizzle-lua-slow:
	./parse-logs logs logs/slow.log > slow.csv
	R --no-save --slave < plot.r --no-save -q --args slow.csv
	tpage --define title='ngx_lua + ngx_drizzle + lua-rds-parser on Amazon EC2 Micro' \
	    --define desc='All software runs in a single Micro instance.' \
	    --define or_ver=1.0.11.28 \
	    --define os='Amazon Linux AMI release 2011.09 (x86_64)' \
	    --define ngx_config=ngx-drizzle-lua-test/conf/nginx.conf \
	    --define mysql_ver=5.1.61 \
	    --define time="`date`" \
	    index.tt > slow.html

gen-lua-slow:
	./parse-logs logs logs/slow.log > slow.csv
	R --no-save --slave < plot.r --no-save -q --args slow.csv
	tpage --define title='ngx_lua + lua-resty-mysql on Amazon EC2 Micro' \
	    --define desc='All software runs in a single Micro instance.' \
	    --define or_ver=1.0.11.28 \
	    --define os='Amazon Linux AMI release 2011.09 (x86_64)' \
	    --define ngx_config=ngx-lua-test/conf/nginx.conf \
	    --define mysql_ver=5.1.61 \
	    --define time="`date`" \
	    index.tt > slow.html

