import { AppLayout } from '@/components';
import { QueryDisplay } from '@/components/queryDisplay/QueryDisplay';
import { organizationQuery } from '@/gql/queries';
import { CreateUpdateOrganizationForm } from '@/modules/organization/CreateUpdateOrganizationForm';

export default function EditOrganizationPage() {
  const { query } = organizationQuery();
  return (
    <AppLayout>
      <h1>Edit Organization</h1>
      <QueryDisplay query={query} hasData={!!query.data?.organizations.length}>
        <CreateUpdateOrganizationForm
          actionButtonLabel="UPDATE ORGANIZATION"
          initialValues={query.data?.organizations[0]}
        />
      </QueryDisplay>
    </AppLayout>
  );
}
