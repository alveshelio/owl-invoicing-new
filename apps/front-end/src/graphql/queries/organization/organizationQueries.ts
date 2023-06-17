import { organizationDocument } from '@/gql/documents';
import { getToken, getUser } from '@/helpers/auth';
import { getGraphQLClient } from '@/libs/getGraphQLClient';
import { OrganizationEntity } from '@/models/organizationModels';
import { createQuery } from '@tanstack/solid-query';
import { ClientError, GraphQLClient } from 'graphql-request';

export const organizationQuery = (enabled?: boolean) => {
  const user = getUser();
  const tokenId = getToken();
  const client = getGraphQLClient();
  const key = ['organization', { userId: user?.id }];
  type QueryKey = () => typeof key;
  const query = createQuery<GraphQLClient, ClientError, { organizations: OrganizationEntity[] }, QueryKey>(
    () => key,
    () => client.request(organizationDocument, { userId: user?.id }),
    {
      get enabled() {
        return typeof enabled !== 'undefined' ? enabled : !!tokenId;
      },
      refetchOnWindowFocus: false,
    }
  );

  return { key, query };
};
