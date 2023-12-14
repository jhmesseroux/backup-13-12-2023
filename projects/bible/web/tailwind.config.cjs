/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  darkMode: 'class',
  theme: {
    screens: {
      'sm': '500px',
      'md': '750px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px',
    },
    extend: {
      colors: {
        brand: 'var(--brand-color)',
        dark : 'var(--dark-color)',
        darkbox : 'var(--dark-color-box)',
        darktext : 'var(--dark-text)',
      },
      backgroundColor: {
        brand: 'rgb(212,188,0)'
      },
      screens: {
        'xs': '0px',
      }
    },
  },
  plugins: [],
};
