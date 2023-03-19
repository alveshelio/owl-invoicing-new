import { EntityAddress, EntityPhoneNumber } from '@/models/generics';

export type OrganizationInput = {
  userId: string;
  email: string;
  name: string;
} & EntityAddress &
  EntityPhoneNumber;

export type OrganizationEntity = Omit<OrganizationInput, 'userId'> & {
  id: string;
};
