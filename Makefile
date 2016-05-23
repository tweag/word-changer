
# examples:

# make
# make arch=armv7

arch=x86_64
root=/home/rainbow/word_changer
name=word_changer
version=1.0

build: FORCE
	sudo rainbow --build $(root) --arch $(arch)

pack:
	sudo rainbow --pack $(root) --arch $(arch)

install:
	sudo rainbow --install $(root)/build/x86_64/com.promptworks.$(name)-$(version)-$(arch).rbw

remove:
	sudo rainbow --remove word_changer

list:
	rainbow --list $(name)

send-to-nas:
	scp build/armv7/com.promptworks.$(name)-$(version)-$(arch).rbw nas:

unmount:
	sudo umount -l $(root)/build/$(arch)/chroot

clean: FORCE
	sudo rainbow --clean $(root) --arch $(arch)

FORCE:
