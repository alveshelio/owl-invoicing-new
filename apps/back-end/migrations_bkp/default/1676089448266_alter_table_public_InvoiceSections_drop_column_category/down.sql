alter table "public"."InvoiceSections" alter column "category" drop not null;
alter table "public"."InvoiceSections" add column "category" varchar;
