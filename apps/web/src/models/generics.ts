export type EntityBase = {
  id: string;
  createdAt: string;
  updatedAt: string;
};

export type EntityPhoneNumber = {
  phoneNumberMobile?: string;
  phoneNumberLandLine?: string;
};

export type EntityAddress = {
  street?: string;
  city?: string;
  postalCode?: string;
  state?: string;
  country?: string;
};
