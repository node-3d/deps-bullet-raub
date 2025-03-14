(
	cd src/bullet3/build
	
	cmake \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
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
		..
	
	cmake --build . --config Release
)

(
	cd src
	
	cp bullet3/build/src/Bullet3Collision/libBullet3Collision.a build/libBullet3Collision.a
	cp bullet3/build/src/Bullet3Common/libBullet3Common.a build/libBullet3Common.a
	cp bullet3/build/src/Bullet3Dynamics/libBullet3Dynamics.a build/libBullet3Dynamics.a
	cp bullet3/build/src/Bullet3Geometry/libBullet3Geometry.a build/libBullet3Geometry.a
	cp bullet3/build/src/Bullet3OpenCL/libBullet3OpenCL_clew.a build/libBullet3OpenCL_clew.a
	cp bullet3/build/src/Bullet3Serialize/Bullet2FileLoader/libBullet2FileLoader.a build/libBullet2FileLoader.a
	cp bullet3/build/src/BulletCollision/libBulletCollision.a build/libBulletCollision.a
	cp bullet3/build/src/BulletDynamics/libBulletDynamics.a build/libBulletDynamics.a
	cp bullet3/build/src/BulletInverseDynamics/libBulletInverseDynamics.a build/libBulletInverseDynamics.a
	cp bullet3/build/src/BulletSoftBody/libBulletSoftBody.a build/libBulletSoftBody.a
	cp bullet3/build/src/LinearMath/libLinearMath.a build/libLinearMath.a
)
