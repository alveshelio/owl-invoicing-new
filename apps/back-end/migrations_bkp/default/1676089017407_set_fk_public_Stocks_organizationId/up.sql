alter table "public"."Stocks" drop constraint "Stocks_organizationId_fkey",
  add constraint "Stocks_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."Organizations"
  ("id") on update restrict on delete restrict;
