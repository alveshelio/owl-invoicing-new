import { invoiceStatuses } from '@/constants/invoiceConstants';
import { OrganizationClient } from '@/models/clientModels';
import { EntityBase } from '@/models/generics';
import { Quotation } from '@/models/quotationModels';

type InvoiceStatusKeys = keyof typeof invoiceStatuses;

export type InvoiceStatuses = (typeof invoiceStatuses)[InvoiceStatusKeys];

export type Invoice = EntityBase & {
  number: number;
  amount: number;
  status: InvoiceStatuses;
};

export type AllInvoicesQuery = Invoice & {
  Quotation?: Quotation;
  Client: OrganizationClient;
};
