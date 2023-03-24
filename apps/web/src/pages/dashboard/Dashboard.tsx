import { AppLayout } from '@/components';
import { QueryDisplay } from '@/components/queryDisplay/QueryDisplay';
import { organizationQuery } from '@/gql/queries';
import { OrganizationDisplay } from '@/modules/organization/OrganizationDisplay';
import { useNavigate } from '@solidjs/router';
import { createEffect } from 'solid-js';

export default function DashboardPage() {
  const navigate = useNavigate();
  const { query } = organizationQuery();

  // TODO rethink how and where redirection should be done
  createEffect(() => {
    if (!query.isLoading && !query.data?.organizations.length) {
      navigate('/organization/new');
    }
  });

  return (
    <AppLayout>
      <h1>Dashboard</h1>
      <QueryDisplay query={query} hasData={!!query.data?.organizations.length}>
        <div class="flex flex-col gap-4">
          <OrganizationDisplay organization={query.data?.organizations[0]} />
        </div>
      </QueryDisplay>
    </AppLayout>
  );
}
