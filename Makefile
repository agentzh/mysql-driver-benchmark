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

