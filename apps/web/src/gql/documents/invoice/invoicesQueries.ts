import { gql } from 'graphql-request';

export const allInvoicesDocument = gql`
  query AllInvoices($organizationId: uuid!) {
    invoices(where: { organizationId: { _eq: $organizationId } }) {
      id
      amount
      status
      Quotation {
        number
      }
      Client {
        name
      }
    }
  }
`;
