(
	cd src
	
	rm -rf build
	mkdir -p build
	
	rm -rf bullet3
	git clone --depth 1 -b 3.25 https://github.com/bulletphysics/bullet3.git
	
	mkdir -p bullet3/installed
	mkdir -p bullet3/build
)
