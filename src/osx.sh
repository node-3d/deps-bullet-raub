(
	cd src/bullet3/build
	
	cmake \
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

cp src/bullet3/build/src/Bullet3Collision/libBullet3Collision.a src/build/libBullet3Collision.a
cp src/bullet3/build/src/Bullet3Common/libBullet3Common.a src/build/libBullet3Common.a
cp src/bullet3/build/src/Bullet3Dynamics/libBullet3Dynamics.a src/build/libBullet3Dynamics.a
cp src/bullet3/build/src/Bullet3Geometry/libBullet3Geometry.a src/build/libBullet3Geometry.a
cp src/bullet3/build/src/Bullet3OpenCL/libBullet3OpenCL_clew.a src/build/libBullet3OpenCL_clew.a
cp src/bullet3/build/src/Bullet3Serialize/Bullet2FileLoader/libBullet2FileLoader.a src/build/libBullet2FileLoader.a
cp src/bullet3/build/src/BulletCollision/libBulletCollision.a src/build/libBulletCollision.a
cp src/bullet3/build/src/BulletDynamics/libBulletDynamics.a src/build/libBulletDynamics.a
cp src/bullet3/build/src/BulletInverseDynamics/libBulletInverseDynamics.a src/build/libBulletInverseDynamics.a
cp src/bullet3/build/src/BulletSoftBody/libBulletSoftBody.a src/build/libBulletSoftBody.a
cp src/bullet3/build/src/LinearMath/libLinearMath.a src/build/libLinearMath.a
