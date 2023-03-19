import { gql } from 'graphql-request';

export const createOrganizationDocument = gql`
  mutation CreateOrganization($organization: Organizations_insert_input!) {
    insertOrganization(object: $organization) {
      id
    }
  }
`;
