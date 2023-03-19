alter table "public"."QuotationSections"
  add constraint "QuotationSections_category_fkey"
  foreign key ("category")
  references "public"."Categories"
  ("value") on update restrict on delete restrict;
