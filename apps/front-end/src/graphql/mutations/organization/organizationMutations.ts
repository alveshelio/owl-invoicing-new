import { createOrganizationDocument } from '@/gql/documents/organization/organizationMutations';
import { OrganizationInput } from '@/models/organizationModels';
import { createMutation } from '@tanstack/solid-query';
import { getGraphQLClient } from '@/libs/getGraphQLClient';
import { ClientError } from 'graphql-request';

type OrganizationVariables = {
  organization: OrganizationInput;
};

export const createOrganizationMutation = () => {
  const client = getGraphQLClient();
  const key = ['createOrganization'];
  return createMutation<{ id: string }, ClientError, OrganizationVariables, unknown>(
    key,
    (variables: OrganizationVariables) => client.request(createOrganizationDocument, variables)
  );
};
