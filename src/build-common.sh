(
	cd src/bullet3/build
	
	cmake -A x64 \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_BULLET2_DEMOS=OFF \
		-DBUILD_OPENGL3_DEMOS=OFF \
		-DBUILD_CPU_DEMOS=OFF \
		-DBUILD_UNIT_TESTS=OFF \
		-DBUILD_CLSOCKET=OFF \
		-DBUILD_ENET=OFF \
		-DBUILD_EXTRAS=OFF \
		-DENABLE_VHACD=OFF \
		-DUSE_GLUT=OFF \
		-DINSTALL_LIBS=ON \
		-DUSE_GRAPHICAL_BENCHMARK=OFF \
		-DUSE_SOFT_BODY_MULTI_BODY_DYNAMICS_WORLD=OFF \
		-DCMAKE_INSTALL_PREFIX=../installed \
		..
	
	cmake --build . --config Release
	
	cmake --install . --config Release
)