# Bullet binaries

This is a part of [Node3D](https://github.com/node-3d) project.

[![NPM](https://nodei.co/npm/deps-bullet-raub.png?compact=true)](https://www.npmjs.com/package/deps-bullet-raub)

[![Build Status](https://api.travis-ci.com/node-3d/deps-bullet-raub.svg?branch=master)](https://travis-ci.com/node-3d/deps-bullet-raub)
[![CodeFactor](https://www.codefactor.io/repository/github/node-3d/deps-bullet-raub/badge)](https://www.codefactor.io/repository/github/node-3d/deps-bullet-raub)

> npm i deps-bullet-raub


## Synopsis

This dependency package is distributing **Bullet Physics**
binaries through **NPM** for **Node.js** addons.

* Platforms (x64): Windows, Linux, OSX.
* Library: Bullet physics.
* Linking: static lib-type.


## Usage

If you don't know Bullet Physics, then probably you could learn it better before
rushing into the Node.js addons with it. Anyway
[the official manual](https://github.com/bulletphysics/bullet3/blob/master/docs/Bullet_User_Manual.pdf)
is a good place to start. Also there are a lot of
[examples](https://github.com/bulletphysics/bullet3/tree/master/examples).

And, the most important, take a look at the existing
[bullet-raub](https://github.com/node-3d/bullet-raub) addon, that exports
a very simple API for Node.js.

---


### Example binding.gyp

As in [glfw-raub](https://github.com/node-3d/glfw-raub/tree/master/src) Node.js addon.

```javascript
{
	'variables': {
		'bin'            : '<!(node -p "require(\'addon-tools-raub\').bin")',
		'bullet_include' : '<!(node -p "require(\'deps-bullet-raub\').include")',
		'bullet_bin'     : '<!(node -p "require(\'deps-bullet-raub\').bin")',
	},
	'targets': [
		{
			'target_name' : 'bullet',
			'sources' : [
				'cpp/bindings.cpp',
				'cpp/body.cpp',
				'cpp/joint.cpp',
				'cpp/scene.cpp',
			],
			'include_dirs' : [
				'<!@(node -p "require(\'addon-tools-raub\').include")',
				'<(bullet_include)',
			],
			'library_dirs' : [ '<(bullet_bin)' ],
			'libraries'    : [ '-lbullet' ],
			'cflags!': ['-fno-exceptions'],
			'cflags_cc!': ['-fno-exceptions'],
			'conditions': [
				
				[
					'OS=="linux"',
					{
						'libraries': [
							"-Wl,-rpath,'$$ORIGIN'",
							"-Wl,-rpath,'$$ORIGIN/../node_modules/deps-bullet-raub/<(bin)'",
							"-Wl,-rpath,'$$ORIGIN/../../deps-bullet-raub/<(bin)'",
						],
						'defines': ['__linux__'],
					}
				],
				
				[
					'OS=="mac"',
					{
						'libraries': [
							'-Wl,-rpath,@loader_path',
							'-Wl,-rpath,@loader_path/../node_modules/deps-bullet-raub/<(bin)',
							'-Wl,-rpath,@loader_path/../../deps-bullet-raub/<(bin)',
						],
						'defines': ['__APPLE__'],
					}
				],
				
				[
					'OS=="win"',
					{
						'defines' : [
							'WIN32_LEAN_AND_MEAN',
							'VC_EXTRALEAN',
							'_WIN32',
						],
						'msvs_settings' : {
							'VCCLCompilerTool' : {
								'AdditionalOptions' : [
									'/GL', '/GF', '/EHsc', '/GS', '/Gy', '/GR-',
								]
							},
							'VCLinkerTool' : {
								'AdditionalOptions' : ['/RELEASE','/OPT:REF','/OPT:ICF','/LTCG'],
							},
						},
					},
				],
				
			],
		},
	]
}
```


### addon.cpp

```cpp
#include <...>
```


## Legal notice

This software uses the [Bullet physics open source library](http://bulletphysics.org/wordpress/).
Bullet is legally used under the ZLIB license.
It is explicitly stated that Bullet can be used commercially in closed-source projects.
Bullet licensing information (a COPY) is given in a [separate file](/BULLET_ZLIB),
which also can be found on
[Bullet's official repository](https://github.com/bulletphysics/bullet3/blob/master/LICENSE.txt).

Binaries for all current platforms are built through MAKE system with
[Travis CI matrix](https://travis-ci.com/node-3d/deps-bullet-raub).
See Travis [config](https://github.com/node-3d/deps-bullet-raub/blob/master/.travis.yml) for details.
Brute-force extracted Bullet sources are
inside `cpp` [folder](https://github.com/raub/node-deps-bullet/tree/master/cpp).
As the layout of Bullet's source tree and the way it is compiled were changed, the whole
new codebase is published here to both comply with ZLIB requirements and provide means for
further expansion of this set of precompiled binaries to different platforms.

Only Bullet-2 part is compiled, Bullet-3 and CL are excluded, for now. No changes to
the original content of any Bullet source file were made. No claims are made that
any physics algorithms are changed/invented within this repository.
