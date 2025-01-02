.PHONY: build
build:
	cd themes/smigle/site && hugo --gc


.PHONY: launch
launch: build
	cd themes/smigle/site && hugo server
