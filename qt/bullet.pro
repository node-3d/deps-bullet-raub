CONFIG(debug, debug|release): CONFIG -= release
else: CONFIG -= debug

QT -= core gui
CONFIG += c++11

TEMPLATE = lib
TARGET = bullet


DEFINES += BT_USE_INVERSE_DYNAMICS_WITH_BULLET2
QMAKE_LFLAGS += /INCLUDE


DESTDIR = $$PWD/../bin_win32
contains(QMAKE_TARGET.arch, x86_64):{
	DESTDIR = $$PWD/../bin_win64
}

macx {
	DESTDIR = $$PWD/../bin_mac64
}

linux-g++ {
	DESTDIR = $$PWD/../bin_linux32
	contains(QMAKE_TARGET.arch, x86_64):{
		DESTDIR = $$PWD/../bin_linux64
	}
}


INCLUDEPATH += \
	$$PWD/../include \
	$$PWD/../include/_subdir \
	$$PWD/../include/_subdir/_subdir

SOURCES += \
	btActivatingCollisionAlgorithm.cpp \
	btAlignedAllocator.cpp \
	btAxisSweep3.cpp \
	btBox2dBox2dCollisionAlgorithm.cpp \
	btBox2dShape.cpp \
	btBoxBoxCollisionAlgorithm.cpp \
	btBoxBoxDetector.cpp \
	btBoxShape.cpp \
	btBroadphaseProxy.cpp \
	btBvhTriangleMeshShape.cpp \
	btCapsuleShape.cpp \
	btCollisionAlgorithm.cpp \
	btCollisionDispatcher.cpp \
	btCollisionDispatcherMt.cpp \
	btCollisionObject.cpp \
	btCollisionShape.cpp \
	btCollisionWorld.cpp \
	btCollisionWorldImporter.cpp \
	btCompoundCollisionAlgorithm.cpp \
	btCompoundCompoundCollisionAlgorithm.cpp \
	btCompoundShape.cpp \
	btConcaveShape.cpp \
	btConeShape.cpp \
	btConeTwistConstraint.cpp \
	btContactConstraint.cpp \
	btContactProcessing.cpp \
	btContinuousConvexCollision.cpp \
	btConvex2dConvex2dAlgorithm.cpp \
	btConvex2dShape.cpp \
	btConvexCast.cpp \
	btConvexConcaveCollisionAlgorithm.cpp \
	btConvexConvexAlgorithm.cpp \
	btConvexHull.cpp \
	btConvexHullComputer.cpp \
	btConvexHullShape.cpp \
	btConvexInternalShape.cpp \
	btConvexPlaneCollisionAlgorithm.cpp \
	btConvexPointCloudShape.cpp \
	btConvexPolyhedron.cpp \
	btConvexShape.cpp \
	btConvexTriangleMeshShape.cpp \
	btCylinderShape.cpp \
	btDantzigLCP.cpp \
	btDbvt.cpp \
	btDbvtBroadphase.cpp \
	btDefaultCollisionConfiguration.cpp \
	btDefaultSoftBodySolver.cpp \
	btDiscreteDynamicsWorld.cpp \
	btDiscreteDynamicsWorldMt.cpp \
	btDispatcher.cpp \
	btEmptyCollisionAlgorithm.cpp \
	btEmptyShape.cpp \
	btFixedConstraint.cpp \
	btGearConstraint.cpp \
	btGeneric6DofConstraint.cpp \
	btGeneric6DofSpring2Constraint.cpp \
	btGeneric6DofSpringConstraint.cpp \
	btGenericPoolAllocator.cpp \
	btGeometryUtil.cpp \
	btGhostObject.cpp \
	btGImpactBvh.cpp \
	btGImpactCollisionAlgorithm.cpp \
	btGImpactQuantizedBvh.cpp \
	btGImpactShape.cpp \
	btGjkConvexCast.cpp \
	btGjkEpa2.cpp \
	btGjkEpaPenetrationDepthSolver.cpp \
	btGjkPairDetector.cpp \
	btHashedSimplePairCache.cpp \
	btHeightfieldTerrainShape.cpp \
	btHinge2Constraint.cpp \
	btHingeConstraint.cpp \
	btInternalEdgeUtility.cpp \
	btKinematicCharacterController.cpp \
	btLemkeAlgorithm.cpp \
	btManifoldResult.cpp \
	btMinkowskiPenetrationDepthSolver.cpp \
	btMinkowskiSumShape.cpp \
	btMLCPSolver.cpp \
	btMultiBody.cpp \
	btMultiBodyConstraint.cpp \
	btMultiBodyConstraintSolver.cpp \
	btMultiBodyDynamicsWorld.cpp \
	btMultiBodyFixedConstraint.cpp \
	btMultiBodyGearConstraint.cpp \
	btMultiBodyJointLimitConstraint.cpp \
	btMultiBodyJointMotor.cpp \
	btMultiBodyPoint2Point.cpp \
	btMultiBodySliderConstraint.cpp \
	btMultimaterialTriangleMeshShape.cpp \
	btMultiSphereShape.cpp \
	btNNCGConstraintSolver.cpp \
	btOptimizedBvh.cpp \
	btOverlappingPairCache.cpp \
	btPersistentManifold.cpp \
	btPoint2PointConstraint.cpp \
	btPolarDecomposition.cpp \
	btPolyhedralContactClipping.cpp \
	btPolyhedralConvexShape.cpp \
	btQuantizedBvh.cpp \
	btQuickprof.cpp \
	btRaycastCallback.cpp \
	btRaycastVehicle.cpp \
	btRigidBody.cpp \
	btScaledBvhTriangleMeshShape.cpp \
	btSequentialImpulseConstraintSolver.cpp \
	btSerializer.cpp \
	btSerializer64.cpp \
	btShapeHull.cpp \
	btSimpleBroadphase.cpp \
	btSimpleDynamicsWorld.cpp \
	btSimulationIslandManager.cpp \
	btSimulationIslandManagerMt.cpp \
	btSliderConstraint.cpp \
	btSoftBody.cpp \
	btSoftBodyConcaveCollisionAlgorithm.cpp \
	btSoftBodyHelpers.cpp \
	btSoftBodyRigidBodyCollisionConfiguration.cpp \
	btSoftMultiBodyDynamicsWorld.cpp \
	btSoftRigidCollisionAlgorithm.cpp \
	btSoftRigidDynamicsWorld.cpp \
	btSoftSoftCollisionAlgorithm.cpp \
	btSolve2LinearConstraint.cpp \
	btSphereBoxCollisionAlgorithm.cpp \
	btSphereShape.cpp \
	btSphereSphereCollisionAlgorithm.cpp \
	btSphereTriangleCollisionAlgorithm.cpp \
	btStaticPlaneShape.cpp \
	btStridingMeshInterface.cpp \
	btSubSimplexConvexCast.cpp \
	btTetrahedronShape.cpp \
	btThreads.cpp \
	btTriangleBuffer.cpp \
	btTriangleCallback.cpp \
	btTriangleIndexVertexArray.cpp \
	btTriangleIndexVertexMaterialArray.cpp \
	btTriangleMesh.cpp \
	btTriangleMeshShape.cpp \
	btTriangleShapeEx.cpp \
	btTypedConstraint.cpp \
	btUniformScalingShape.cpp \
	btUnionFind.cpp \
	btUniversalConstraint.cpp \
	btVector3.cpp \
	btVoronoiSimplexSolver.cpp \
	btWheelInfo.cpp \
	gim_box_set.cpp \
	gim_contact.cpp \
	gim_memory.cpp \
	gim_tri_collision.cpp \
	IDMath.cpp \
	MultiBodyTree.cpp \
	MultiBodyTreeImpl.cpp \
	MultiBodyTreeInitCache.cpp \
	SphereTriangleDetector.cpp



