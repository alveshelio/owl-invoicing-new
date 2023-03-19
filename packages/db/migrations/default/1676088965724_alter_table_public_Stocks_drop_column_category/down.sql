alter table "public"."Stocks" alter column "category" drop not null;
alter table "public"."Stocks" add column "category" varchar;
