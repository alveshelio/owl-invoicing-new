alter table "public"."InvoiceSections"
  add constraint "InvoiceSections_categoryId_fkey"
  foreign key ("categoryId")
  references "public"."InvoiceQuotationCategories"
  ("id") on update restrict on delete restrict;
