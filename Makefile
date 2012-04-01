today=$(shell date +"%m%d")
now=$(shell date +"%H%M")
name=bench-$(today)-$(now)

.PHONY: all clean

all: ;

clean:
	rm *-domU-*.* *.log

dist:
	cd .. && tar --exclude='*~' --exclude='*.swp' --exclude='*.swo' -czvf $(name).tar.gz bench
	ls -lh ../$(name).tar.gz

