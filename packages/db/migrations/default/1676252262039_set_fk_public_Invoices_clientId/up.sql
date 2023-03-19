alter table "public"."Invoices"
  add constraint "Invoices_clientId_fkey"
  foreign key ("clientId")
  references "public"."Clients"
  ("id") on update restrict on delete restrict;
