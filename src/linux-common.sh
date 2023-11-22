chmod +x src/build-common.sh && src/build-common.sh

cp src/bullet3/build/lib/Release/LinearMath.a src/build/LinearMath.a
cp src/bullet3/build/lib/Release/Bullet2FileLoader.a src/build/Bullet2FileLoader.a
cp src/bullet3/build/lib/Release/Bullet3Collision.a src/build/Bullet3Collision.a
cp src/bullet3/build/lib/Release/Bullet3Common.a src/build/Bullet3Common.a
cp src/bullet3/build/lib/Release/Bullet3Dynamics.a src/build/Bullet3Dynamics.a
cp src/bullet3/build/lib/Release/Bullet3Geometry.a src/build/Bullet3Geometry.a
cp src/bullet3/build/lib/Release/Bullet3OpenCL_clew.a src/build/Bullet3OpenCL_clew.a
cp src/bullet3/build/lib/Release/BulletCollision.a src/build/BulletCollision.a
cp src/bullet3/build/lib/Release/BulletDynamics.a src/build/BulletDynamics.a
cp src/bullet3/build/lib/Release/BulletInverseDynamics.a src/build/BulletInverseDynamics.a
cp src/bullet3/build/lib/Release/BulletSoftBody.a src/build/BulletSoftBody.a
