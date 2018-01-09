# node-deps-bullet


## Abstract

Common dependencies for bullet-dependent compilation. +Binaries.

* Platforms: win x32/x64, linux x32/x64, mac x64.
* Libraries: bullet.


## Install

`npm i -s node-deps-bullet-raub`


## Use

**binding.gyp**

```javascript
	'variables': {
		'bullet_include' : '<!(node -e "console.log(require(\'node-deps-bullet-raub\').include)")',
		'bullet_bin'     : '<!(node -e "console.log(require(\'node-deps-bullet-raub\').bin)")',
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
