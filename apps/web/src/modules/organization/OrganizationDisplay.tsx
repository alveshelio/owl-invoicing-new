import { OrganizationEntity } from '@/models/organizationModels';
import { Link } from '@solidjs/router';

type OrganizationDisplayProps = {
  organization?: OrganizationEntity;
};
export const OrganizationDisplay = (props: OrganizationDisplayProps) => {
  return (
    <>
      <h2>Organization</h2>
      <div>Name: {props.organization?.name}</div>
      <div class="flex justify-end mt-5">
        <Link href={`/organization/${props.organization?.id}/edit`}>
          <button class="border border-green-700 rounded-xl py-2 px-3 bg-green-600 text-white" type="submit">
            EDIT ORGANIZATION
          </button>
        </Link>
      </div>
    </>
  );
};
