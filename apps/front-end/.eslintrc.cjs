module.exports = {
  root: true,
  extends: [
    'base',
    'eslint:recommended',
    'plugin:solid/recommended',
    'plugin:prettier/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    project: ['./tsconfig.json'],
  },
  plugins: [
    'unused-imports',
    'solid',
    'jsx-a11y',
    'prettier',
    'simple-import-sort',
  ],
  overrides: [
    {
      files: ['src/**/*.spec.tsx'],
      extends: ['plugin:playwright/playwright-test'],
    },
  ],
  env: {
    node: true,
  },
  rules: {
    'simple-import-sort/imports': 'error',
    'simple-import-sort/exports': 'error',
    'import/first': 'error',
    'import/newline-after-import': 'error',
    'import/no-duplicates': 'error',
    // turn on errors for missing imports
    'import/no-unresolved': 'error',
  },
  settings: {
    'import/parsers': {
      '@typescript-eslint/parser': ['.ts', '.tsx'],
    },
    'import/resolver': {
      typescript: {
        alwaysTryTypes: true, // always try to resolve types under `<root>@types` directory even it doesn't contain any source code, like `@types/unist`
        project: './tsconfig.json',
      },
    },
  },
};
