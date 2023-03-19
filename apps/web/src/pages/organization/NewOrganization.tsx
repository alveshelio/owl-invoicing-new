import { AppLayout } from '@/components';
import { CreateUpdateOrganizationForm } from '@/modules/organization/CreateUpdateOrganizationForm';

export default function NewOrganizationPage() {
  return (
    <AppLayout>
      <h1>Create New Organization</h1>
      <CreateUpdateOrganizationForm actionButtonLabel="CREATE ORGANIZATION" />
    </AppLayout>
  );
}
