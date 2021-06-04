module.exports = {
	// future: {
	// 	removeDeprecatedGapUtilities: true,
	// 	purgeLayersByDefault: true,
	// },
	mode: 'jit',
	purge: ['./public/**/*.html'],
	darkMode: 'class',
	theme: {
		extend: {},
	},
	variants: {
		extend: {
			display: ['dark'],
		},
	},
	plugins: [],
}
