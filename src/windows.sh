(
	cd src/bullet3/build
	
	cmake -A x64 -T v142 \
		-DCMAKE_POLICY_DEFAULT_CMP0091=NEW \
		-DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreadedDLL" \
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
	
	# Use install to fetch INCLUDES
	# cmake --install . --config Release
)

(
	cd src
	
	cp bullet3/build/lib/Release/LinearMath.lib build/LinearMath.lib
	cp bullet3/build/lib/Release/Bullet2FileLoader.lib build/Bullet2FileLoader.lib
	cp bullet3/build/lib/Release/Bullet3Collision.lib build/Bullet3Collision.lib
	cp bullet3/build/lib/Release/Bullet3Common.lib build/Bullet3Common.lib
	cp bullet3/build/lib/Release/Bullet3Dynamics.lib build/Bullet3Dynamics.lib
	cp bullet3/build/lib/Release/Bullet3Geometry.lib build/Bullet3Geometry.lib
	cp bullet3/build/lib/Release/Bullet3OpenCL_clew.lib build/Bullet3OpenCL_clew.lib
	cp bullet3/build/lib/Release/BulletCollision.lib build/BulletCollision.lib
	cp bullet3/build/lib/Release/BulletDynamics.lib build/BulletDynamics.lib
	cp bullet3/build/lib/Release/BulletInverseDynamics.lib build/BulletInverseDynamics.lib
	cp bullet3/build/lib/Release/BulletSoftBody.lib build/BulletSoftBody.lib
)
