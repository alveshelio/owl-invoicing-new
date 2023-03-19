import { AppLayout } from '@/components';
import { QueryDisplay } from '@/components/queryDisplay/QueryDisplay';
import { OrganizationDisplay } from '@/modules/organization/OrganizationDisplay';
import { organizationQuery } from '@/gql/queries';
import { useNavigate } from '@solidjs/router';

export default function Organization() {
  const navigate = useNavigate();
  const { query } = organizationQuery();

  // we don't have an organization yet, we must redirect the user to create one
  if (!query.isLoading && !query.data?.organizations.length) {
    navigate('/organization/new');
  }

  return (
    <AppLayout>
      <QueryDisplay query={query} hasData={!!query.data?.organizations.length}>
        <OrganizationDisplay organization={query.data?.organizations[0]} />
      </QueryDisplay>
    </AppLayout>
  );
}
