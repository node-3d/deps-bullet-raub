{
	'variables': {
		'rm'  : '<!(node -e "console.log(require(\'addon-tools-raub\').rm)")',
		'rem' : '<!(node -e "console.log(require(\'.\').rem)")',
	},
	'targets': [
		{
			'target_name' : 'remove_extras',
			'type'        : 'none',
			'actions'     : [
				{
					'action_name' : 'Unnecessary binaries removed.',
					'inputs'      : ['package.json'],
					'outputs'     : ['build'],
					'action'      : ['<(rm)', '-rf', '<@(rem)'],
				}
			],
		}
	]
}
