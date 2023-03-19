alter table "public"."OrganizationClients" drop constraint "OrganizationClients_email_organizationId_key";
alter table "public"."OrganizationClients" add constraint "OrganizationClients_email_key" unique ("email");
