alter table "public"."Stocks"
  add constraint "Stocks_categoryId_fkey"
  foreign key ("categoryId")
  references "public"."StockCategories"
  ("id") on update restrict on delete restrict;
