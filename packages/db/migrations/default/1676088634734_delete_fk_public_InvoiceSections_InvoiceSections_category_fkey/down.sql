alter table "public"."InvoiceSections"
  add constraint "InvoiceSections_category_fkey"
  foreign key ("category")
  references "public"."Categories"
  ("value") on update restrict on delete restrict;
