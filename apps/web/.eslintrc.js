// eslint-disable-next-line no-undef
module.exports = {
  extends: ['base', 'plugin:solid/typescript'],
  parserOptions: {
    project: ['./tsconfig.json'],
  },

  settings: {
    'import/resolver': {
      typescript: {
        project: './tsconfig.json',
      },
    },
  },
};
