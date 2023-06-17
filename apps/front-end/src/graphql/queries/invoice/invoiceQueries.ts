import { allInvoicesDocument } from '@/gql/documents';
import { organizationQuery } from '@/gql/queries';
import { getGraphQLClient } from '@/libs/getGraphQLClient';
import { AllInvoicesQuery } from '@/models/invoiceModels';
import { createQuery } from '@tanstack/solid-query';
import { ClientError, GraphQLClient } from 'graphql-request';

export const allInvoicesQuery = () => {
  const client = getGraphQLClient();
  const { query: orgQuery } = organizationQuery();

  const key = ['allInvoices', { organizationId: orgQuery.data?.organizations[0]?.id }];
  type QueryKey = () => typeof key;

  const query = createQuery<GraphQLClient, ClientError, { invoices: AllInvoicesQuery[] }, QueryKey>(
    () => key,
    async () => client.request(allInvoicesDocument, { organizationId: orgQuery.data?.organizations[0].id }),
    {
      get enabled() {
        return !!orgQuery.data?.organizations[0];
      },
      refetchOnWindowFocus: false,
    }
  );

  return { query, key };
};
