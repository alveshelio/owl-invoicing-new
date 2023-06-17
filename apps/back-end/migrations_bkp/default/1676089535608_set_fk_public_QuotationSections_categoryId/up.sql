alter table "public"."QuotationSections"
  add constraint "QuotationSections_categoryId_fkey"
  foreign key ("categoryId")
  references "public"."InvoiceQuotationCategories"
  ("id") on update restrict on delete restrict;
