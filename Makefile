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
	echo "=========== MySQL ==========="
	ps aux|grep mysqld|grep -v safe|grep -v grep
	echo "=========== Nginx ==========="
	ps aux|grep nginx|grep -v grep|grep -v grep
	echo "=========== API ============="
	curl -i localhost:8080/t


