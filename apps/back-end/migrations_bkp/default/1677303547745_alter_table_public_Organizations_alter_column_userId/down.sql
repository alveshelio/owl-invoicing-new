alter table "public"."Organizations" drop constraint "Organizations_userId_key";
alter table "public"."Organizations" alter column "userId" drop not null;
