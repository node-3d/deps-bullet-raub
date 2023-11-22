chmod +x src/build-common.sh && src/build-common.sh

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
