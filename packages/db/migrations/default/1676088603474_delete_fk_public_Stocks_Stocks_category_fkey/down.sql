alter table "public"."Stocks"
  add constraint "Stocks_category_fkey"
  foreign key ("category")
  references "public"."Categories"
  ("value") on update restrict on delete restrict;
