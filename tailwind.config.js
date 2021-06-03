module.exports = {
	// future: {
	// 	removeDeprecatedGapUtilities: true,
	// 	purgeLayersByDefault: true,
	// },
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
