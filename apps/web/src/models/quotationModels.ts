import { quotationStatuses } from '@/constants/quotationConstants';
import { EntityBase } from '@/models/generics';

export type QuotationStatusKeys = keyof typeof quotationStatuses;
export type QuotationStatuses = (typeof quotationStatuses)[QuotationStatusKeys];

export type Quotation = EntityBase & {
  number: number;
  status: QuotationStatuses;
  validUntil: string;
};
