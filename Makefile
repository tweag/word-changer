
# examples:

# make
# make arch=armv7

arch=x86_64
root=$(shell pwd)
name=word_changer
version=1.0
build_dir=$(root)/build
organization=promptworks

build: FORCE
	sudo rainbow --build $(root) --arch $(arch) --build-dir $(build_dir)

pack:
	sudo rainbow --pack $(root) --arch $(arch) --build-dir $(build_dir)

install:
	sudo rainbow --install $(build_dir)/x86_64/com.$(organization).$(name)-$(version)-$(arch).rbw

remove:
	sudo rainbow --remove ${name}

list:
	rainbow --list $(name)

send-to-nas:
	scp $(build_dir)/armv7/com.$(organization).$(name)-$(version)-$(arch).rbw nas:

unmount:
	sudo umount -l $(root)/build/$(arch)/chroot

clean: FORCE
	sudo rainbow --clean $(root) --arch $(arch) --build-dir $(build_dir)

update:
	make remove && make build && make pack && make install

enter:
	sudo rainbow --enter $(name)

FORCE:
