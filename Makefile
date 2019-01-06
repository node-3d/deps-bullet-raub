OS = $(shell uname -s)
ARCH = 64


ifeq ($(ARCH), 32)
	CL_ARCH       = 86
else
	CL_ARCH       = $(ARCH)
endif


ifeq ($(OS), Windows)
	TARGET_DIR       = bin-win$(ARCH)
	SYS_DEFINES      = -DWIN32
else ifeq ($(OS), Darwin)
	TARGET_DIR       = bin-mac64
	SYS_DEFINES      = -D__APPLE__ -D_DARWIN
else
	TARGET_DIR       = bin-linux64
	SYS_DEFINES      = -D_LINUX
endif

ifeq ($(OS), Windows)
	TARGET_EXT       = lib
else
	TARGET_EXT       = a
endif

TARGET_NAME      = bullet
TARGET           = $(TARGET_DIR)/$(TARGET_NAME).$(TARGET_EXT)


SRC_DIR          = cpp
INC_DIR          = include
OBJ_DIR          = $(TARGET_DIR)

ifeq ($(OS), Windows)
	OBJ_EXT       = obj
else
	OBJ_EXT       = o
endif


DEFINES          = -DUNICODE -D_UNICODE -DBT_USE_INVERSE_DYNAMICS_WITH_BULLET2 -DNDEBUG $(SYS_DEFINES)

ifeq ($(OS), Windows)
	INC_OTHER        = -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.17763.0/ucrt" -I"C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/VC/Tools/MSVC/14.16.27023/include" -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.17763.0/um" -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.17763.0/shared"
else ifeq ($(OS), Darwin)
	INC_OTHER        = 
else
	INC_OTHER        = 
endif

INCPATH          = -I$(SRC_DIR) -I. -I$(INC_DIR) -I$(INC_DIR)/_subdir -I$(INC_DIR)/_subdir/_subdir $(INC_OTHER)


ifeq ($(OS), Windows)
	CXX              = "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/VC/Tools/MSVC/14.16.27023/bin/Hostx64/x$(CL_ARCH)/cl.exe"
	CXXFLAGS         = -nologo -Zc:wchar_t -FS -Zc:rvalueCast -Zc:inline -Zc:strictStrings -Zc:throwingNew -Zc:referenceBinding -O2 -MT -W3 -w34100 -w34189 -w44996 -w44456 -w44457 -w44458 -wd4577 -wd4467 -EHsc $(DEFINES)
	LIBAPP           = "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/VC/Tools/MSVC/14.16.27023/bin/Hostx64/x$(CL_ARCH)/lib.exe"
	LIBFLAGS         = /STACK:10000000 /INCREMENTAL:NO /NOLOGO /OUT:$(TARGET) /machine:X$(CL_ARCH)
else
	CXX              = g++
	CXXFLAGS         = $(DEFINES)
	LIBAPP           = gcc
	LIBFLAGS         = 
endif


OBJECTS = \
 $(OBJ_DIR)/btActivatingCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btAlignedAllocator.$(OBJ_EXT) \
 $(OBJ_DIR)/btAxisSweep3.$(OBJ_EXT) \
 $(OBJ_DIR)/btBox2dBox2dCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btBox2dShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btBoxBoxCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btBoxBoxDetector.$(OBJ_EXT) \
 $(OBJ_DIR)/btBoxShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btBroadphaseProxy.$(OBJ_EXT) \
 $(OBJ_DIR)/btBvhTriangleMeshShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btCapsuleShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionDispatcher.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionDispatcherMt.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionObject.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionWorld.$(OBJ_EXT) \
 $(OBJ_DIR)/btCollisionWorldImporter.$(OBJ_EXT) \
 $(OBJ_DIR)/btCompoundCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btCompoundCompoundCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btCompoundShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConcaveShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConeShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConeTwistConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btContactConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btContactProcessing.$(OBJ_EXT) \
 $(OBJ_DIR)/btContinuousConvexCollision.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvex2dConvex2dAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvex2dShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexCast.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexConcaveCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexConvexAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexHull.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexHullComputer.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexHullShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexInternalShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexPlaneCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexPointCloudShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexPolyhedron.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btConvexTriangleMeshShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btCylinderShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btDantzigLCP.$(OBJ_EXT) \
 $(OBJ_DIR)/btDbvt.$(OBJ_EXT) \
 $(OBJ_DIR)/btDbvtBroadphase.$(OBJ_EXT) \
 $(OBJ_DIR)/btDefaultCollisionConfiguration.$(OBJ_EXT) \
 $(OBJ_DIR)/btDefaultSoftBodySolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btDiscreteDynamicsWorld.$(OBJ_EXT) \
 $(OBJ_DIR)/btDiscreteDynamicsWorldMt.$(OBJ_EXT) \
 $(OBJ_DIR)/btDispatcher.$(OBJ_EXT) \
 $(OBJ_DIR)/btEmptyCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btEmptyShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btFixedConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btGearConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btGeneric6DofConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btGeneric6DofSpring2Constraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btGeneric6DofSpringConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btGenericPoolAllocator.$(OBJ_EXT) \
 $(OBJ_DIR)/btGeometryUtil.$(OBJ_EXT) \
 $(OBJ_DIR)/btGhostObject.$(OBJ_EXT) \
 $(OBJ_DIR)/btGImpactBvh.$(OBJ_EXT) \
 $(OBJ_DIR)/btGImpactCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btGImpactQuantizedBvh.$(OBJ_EXT) \
 $(OBJ_DIR)/btGImpactShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btGjkConvexCast.$(OBJ_EXT) \
 $(OBJ_DIR)/btGjkEpa2.$(OBJ_EXT) \
 $(OBJ_DIR)/btGjkEpaPenetrationDepthSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btGjkPairDetector.$(OBJ_EXT) \
 $(OBJ_DIR)/btHashedSimplePairCache.$(OBJ_EXT) \
 $(OBJ_DIR)/btHeightfieldTerrainShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btHinge2Constraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btHingeConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btInternalEdgeUtility.$(OBJ_EXT) \
 $(OBJ_DIR)/btKinematicCharacterController.$(OBJ_EXT) \
 $(OBJ_DIR)/btLemkeAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btManifoldResult.$(OBJ_EXT) \
 $(OBJ_DIR)/btMinkowskiPenetrationDepthSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btMinkowskiSumShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btMLCPSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBody.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyConstraintSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyDynamicsWorld.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyFixedConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyGearConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyJointLimitConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyJointMotor.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodyPoint2Point.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiBodySliderConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultimaterialTriangleMeshShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btMultiSphereShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btNNCGConstraintSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btOptimizedBvh.$(OBJ_EXT) \
 $(OBJ_DIR)/btOverlappingPairCache.$(OBJ_EXT) \
 $(OBJ_DIR)/btPersistentManifold.$(OBJ_EXT) \
 $(OBJ_DIR)/btPoint2PointConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btPolarDecomposition.$(OBJ_EXT) \
 $(OBJ_DIR)/btPolyhedralContactClipping.$(OBJ_EXT) \
 $(OBJ_DIR)/btPolyhedralConvexShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btQuantizedBvh.$(OBJ_EXT) \
 $(OBJ_DIR)/btQuickprof.$(OBJ_EXT) \
 $(OBJ_DIR)/btRaycastCallback.$(OBJ_EXT) \
 $(OBJ_DIR)/btRaycastVehicle.$(OBJ_EXT) \
 $(OBJ_DIR)/btRigidBody.$(OBJ_EXT) \
 $(OBJ_DIR)/btScaledBvhTriangleMeshShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btSequentialImpulseConstraintSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btSerializer.$(OBJ_EXT) \
 $(OBJ_DIR)/btSerializer64.$(OBJ_EXT) \
 $(OBJ_DIR)/btShapeHull.$(OBJ_EXT) \
 $(OBJ_DIR)/btSimpleBroadphase.$(OBJ_EXT) \
 $(OBJ_DIR)/btSimpleDynamicsWorld.$(OBJ_EXT) \
 $(OBJ_DIR)/btSimulationIslandManager.$(OBJ_EXT) \
 $(OBJ_DIR)/btSimulationIslandManagerMt.$(OBJ_EXT) \
 $(OBJ_DIR)/btSliderConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftBody.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftBodyConcaveCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftBodyHelpers.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftBodyRigidBodyCollisionConfiguration.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftMultiBodyDynamicsWorld.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftRigidCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftRigidDynamicsWorld.$(OBJ_EXT) \
 $(OBJ_DIR)/btSoftSoftCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btSolve2LinearConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btSphereBoxCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btSphereShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btSphereSphereCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btSphereTriangleCollisionAlgorithm.$(OBJ_EXT) \
 $(OBJ_DIR)/btStaticPlaneShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btStridingMeshInterface.$(OBJ_EXT) \
 $(OBJ_DIR)/btSubSimplexConvexCast.$(OBJ_EXT) \
 $(OBJ_DIR)/btTetrahedronShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btThreads.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleBuffer.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleCallback.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleIndexVertexArray.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleIndexVertexMaterialArray.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleMesh.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleMeshShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btTriangleShapeEx.$(OBJ_EXT) \
 $(OBJ_DIR)/btTypedConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btUniformScalingShape.$(OBJ_EXT) \
 $(OBJ_DIR)/btUnionFind.$(OBJ_EXT) \
 $(OBJ_DIR)/btUniversalConstraint.$(OBJ_EXT) \
 $(OBJ_DIR)/btVector3.$(OBJ_EXT) \
 $(OBJ_DIR)/btVoronoiSimplexSolver.$(OBJ_EXT) \
 $(OBJ_DIR)/btWheelInfo.$(OBJ_EXT)


all: $(TARGET)


ifeq ($(OS), Windows)

$(OBJ_DIR)/%.$(OBJ_EXT) :: $(SRC_DIR)/%.cpp
	$(CXX) -c $< $(CXXFLAGS) $(INCPATH) -Fo$(OBJ_DIR)/

else

$(OBJ_DIR)/%.$(OBJ_EXT) :: $(SRC_DIR)/%.cpp
	$(CXX) -c $< $(CXXFLAGS) $(INCPATH) -o $@

endif

$(TARGET): $(OBJECTS)
	$(LIBAPP) $(LIBFLAGS) $(OBJECTS)
