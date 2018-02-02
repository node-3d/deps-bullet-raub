# Bullet binaries

* Platforms: win x32/x64, linux x32/x64, mac x64.
* Library: Bullet physics.
* Linking: static lib-type.


## Install

`npm i -s deps-bullet-raub`


## Legal notice

This software uses the [Bullet physics open source library](http://bulletphysics.org/wordpress/).
Bullet is legally used under the ZLIB license.
It is explicitly stated that Bullet can be used commercially in closed-source projects.
Bullet licensing information (a COPY) is given in a [separate file](/BULLET_ZLIB),
which also can be found on
[Bullet's official repository](https://github.com/bulletphysics/bullet3/blob/master/LICENSE.txt).

Binaries for all current platforms are built through Qt's QMAKE system **WITHOUT** any use of
Qt-libraries. A `.pro` for QMAKE file along with brute-force extracted Bullet sources are
inside `qt` folder [here](https://github.com/raub/node-deps-bullet/tree/master/qt).
As the layout of Bullet's source tree and the way it is compiled were changed, the whole
new codebase is published here to both comply with ZLIB requirements and provide means for
further expansion of this set of precompiled binaries to different platforms.

Only Bullet-2 part is compiled, Bullet-3 and CL are excluded, for now. No changes to
the original content of any Bullet source file were made. No claims are made that
any physics algorithms are changed/invented within this repository.


## Usage

**binding.gyp**

```javascript
	'variables': {
		'bullet_include' : '<!(node -e "require(\'deps-bullet-raub\').include()")',
		'bullet_bin'     : '<!(node -e "require(\'deps-bullet-raub\').bin()")',
	},
	...
	'targets': [
		{
			'target_name': '...',
			
			'include_dirs': [
				'<(bullet_include)',
				...
			],
			
			'library_dirs': [ '<(bullet_bin)' ],
			'libraries'    : [ '-lbullet' ],
			
			'conditions': [
				
				['OS=="linux"', {
					'libraries': [
						'-Wl,-rpath,<(bullet_bin)',
					],
				}],
				
				['OS=="mac"', {
					'libraries': [
						'-Wl,-rpath,<(bullet_bin)',
				}],
				
				['OS=="win"', {
					
				}],
				
			],
		},
```


**addon.cpp**

```cpp
#include <...>
```
