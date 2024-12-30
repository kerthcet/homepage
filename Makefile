.PHONY: build
build:
	cd themes/smigle/site && hugo --gc


.PHONY: launch
launch:
	cd themes/smigle/site && hugo server
