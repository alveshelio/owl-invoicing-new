import { gql } from 'graphql-request';

export const organizationDocument = gql`
  query UserOrganizations($userId: bpchar!) {
    organizations(where: { userId: { _eq: $userId } }) {
      id
      name
      email
      street
      city
      postalCode
      state
      phoneNumberMobile
      phoneNumberLandLine
    }
  }
`;
