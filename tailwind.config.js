const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/forms'),
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        gray: colors.stone,
        "dark-gray": colors.slate,
        brand: {
          light: "#ffdedf",
          DEFAULT: "#d71920",
          // DEFAULT: "#0055AA",
          medium: "#b11116",
          dark: "#8b0304",
        },
      },
      boxShadow: {
        highlight: 'inset 0 1px 0 0 rgb(255 255 255 / 5%)',
      },
      outlineOffset: {
        12: '12px',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
}