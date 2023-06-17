alter table "public"."OrganizationClients" drop constraint "Clients_email_key";
alter table "public"."OrganizationClients" add constraint "OrganizationClients_email_organizationId_key" unique ("email", "organizationId");
