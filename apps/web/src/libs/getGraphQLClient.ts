import { getAuthorizer } from '@/contexts/AuthorizerContext';
import { GraphQLClient } from 'graphql-request';

export const getGraphQLClient = (): GraphQLClient => {
  const [state] = getAuthorizer();

  const headerOptions = () => ({
    headers: {
      'Content-Type': 'application/json',
      'X-Hasura-Role': import.meta.env.VITE_ADMIN_ROLE,
      ...(state.token?.id_token && { Authorization: `Bearer ${state.token?.id_token}` }),
    },
  });

  return new GraphQLClient('http://localhost:8080/v1/graphql', headerOptions());
};
