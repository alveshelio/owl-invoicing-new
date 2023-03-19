alter table "public"."QuotationSections" alter column "category" drop not null;
alter table "public"."QuotationSections" add column "category" varchar;
