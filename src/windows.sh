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
	
	# Use install to fetch INCLUDES
	# cmake --install . --config Release
)

cp src/bullet3/build/lib/Release/LinearMath.lib src/build/LinearMath.lib
cp src/bullet3/build/lib/Release/Bullet2FileLoader.lib src/build/Bullet2FileLoader.lib
cp src/bullet3/build/lib/Release/Bullet3Collision.lib src/build/Bullet3Collision.lib
cp src/bullet3/build/lib/Release/Bullet3Common.lib src/build/Bullet3Common.lib
cp src/bullet3/build/lib/Release/Bullet3Dynamics.lib src/build/Bullet3Dynamics.lib
cp src/bullet3/build/lib/Release/Bullet3Geometry.lib src/build/Bullet3Geometry.lib
cp src/bullet3/build/lib/Release/Bullet3OpenCL_clew.lib src/build/Bullet3OpenCL_clew.lib
cp src/bullet3/build/lib/Release/BulletCollision.lib src/build/BulletCollision.lib
cp src/bullet3/build/lib/Release/BulletDynamics.lib src/build/BulletDynamics.lib
cp src/bullet3/build/lib/Release/BulletInverseDynamics.lib src/build/BulletInverseDynamics.lib
cp src/bullet3/build/lib/Release/BulletSoftBody.lib src/build/BulletSoftBody.lib
