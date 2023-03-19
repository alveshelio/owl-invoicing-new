/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{ts,tsx}",
  ],
  theme: {
    extend: {
      gridTemplateColumns: {
        mainLayout: '100px minmax(360px, 1fr)',
      },
    },
  },
  plugins: [require('@tailwindcss/forms')],
}