import { EntityAddress, EntityBase } from '@/models/generics';

export type OrganizationClient = EntityBase &
  EntityAddress & {
    name: string;
    email: string;
    phoneNumber?: string;
  };
