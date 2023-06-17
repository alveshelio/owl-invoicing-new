alter table "public"."Organizations" alter column "userId" set not null;
alter table "public"."Organizations" add constraint "Organizations_userId_key" unique ("userId");
