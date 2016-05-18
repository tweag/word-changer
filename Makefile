build: FORCE
	sudo rainbow --build /home/rainbow/word_changer --arch x86_64
	sudo rainbow --build /home/rainbow/word_changer --arch armv7

pack:
	sudo rainbow --pack /home/rainbow/word_changer --arch x86_64
	sudo rainbow --pack /home/rainbow/word_changer --arch armv7

install:
	sudo rainbow --install /home/rainbow/word_changer/build/x86_64/com.promptworks.word_changer-1.0-x86_64.rbw

remove:
	sudo rainbow --remove word_changer

clean: FORCE
	sudo rainbow --clean /home/rainbow/word_changers --arch x86_64
	sudo rainbow --clean /home/rainbow/word_changers --arch armv7

list:
	rainbow --list word_changer

FORCE:
