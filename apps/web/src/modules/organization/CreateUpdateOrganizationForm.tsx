import { createOrganizationMutation } from '@/gql/mutations';
import { getUser } from '@/helpers/auth';
import { OrganizationEntity } from '@/models/organizationModels';
import { useNavigate } from '@solidjs/router';
import { Input } from '@ui/input';
import { z } from 'zod';
import { createForm } from '@felte/solid';

type CreateUpdateOrganizationFormProps = {
  initialValues?: OrganizationEntity;
  actionButtonLabel: string;
};
export const CreateUpdateOrganizationForm = (props: CreateUpdateOrganizationFormProps) => {
  const user = getUser();
  const schema = z.object({
    name: z.string().min(3, { message: 'Please provide a valid organization name' }),
    email: z.string().email({ message: 'Please provide a valid email address' }),
    street: z.optional(z.string().min(3, { message: 'Please provide a valid organization name' })),
    city: z.optional(z.string().min(3, { message: 'Please provide a valid organization name' })),
    postalCode: z.optional(z.string().min(3, { message: 'Please provide a valid organization name' })),
    state: z.optional(z.string().min(3, { message: 'Please provide a valid organization name' })),
    phoneNumberMobile: z.optional(z.string().min(3, { message: 'Please provide a valid organization name' })),
    phoneNumberLandLine: z.optional(z.string().min(3, { message: 'Please provide a valid organization name' })),
  });

  const navigate = useNavigate();
  const mutation = createOrganizationMutation();

  const { form } = createForm<z.infer<typeof schema>>({
    initialValues: props.initialValues,
    onSubmit: async (organization) => {
      mutation.mutate(
        { organization: { ...organization, userId: user?.id as string } },
        {
          onSuccess: ({ id }) => {
            navigate(`/organization/${id}`);
          },
        }
      );
    },
  });

  return (
    <form use:form>
      <div>
        <Input name="name" placeholder="Name" />
        <Input name="email" placeholder="Email" />
        <Input name="street" placeholder="Street" />
        <Input name="city" placeholder="City" />
        <Input name="postalCode" placeholder="Postal Code" />
        <Input name="state" placeholder="State" />
        <Input name="phoneNumberMobile" placeholder="Mobile Phone number" />
        <Input name="phoneNumberLandLine" placeholder="Landline Phone number" />
      </div>
      <div class="flex justify-end mt-5">
        <button class="border border-green-700 rounded-xl py-2 px-3 bg-green-600 text-white" type="submit">
          {props.actionButtonLabel}
        </button>
      </div>
    </form>
  );
};
