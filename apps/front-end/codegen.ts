import { CodegenConfig } from '@graphql-codegen/cli';

const config: CodegenConfig = {
  schema: [
    {
      'http://localhost:8080/v1/graphql': {
        headers: {
          'x-hasura-admin-secret': 'myadminsecretkey',
        },
      },
    },
  ],
  documents: ['./src/graphql/**/*.ts', './src/graphql/**/*.graphql'],
  overwrite: true,
  generates: {
    'src/generated/graphql.ts': {
      plugins: ['typescript-common'],
    },
    './graphql.schema.json': {
      plugins: ['introspection'],
    },
  },
};

export default config;
