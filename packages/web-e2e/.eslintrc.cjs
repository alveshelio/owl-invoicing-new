module.exports = {
  extends: [
    'base',
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:playwright/playwright-test',
    'plugin:prettier/recommended',
  ],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint', 'prettier'],
};
