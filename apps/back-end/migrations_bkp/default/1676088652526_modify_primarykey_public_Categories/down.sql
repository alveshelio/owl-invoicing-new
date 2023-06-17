alter table "public"."Categories" drop constraint "Categories_pkey";
alter table "public"."Categories"
    add constraint "Categories_pkey"
    primary key ("value");
