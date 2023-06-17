CREATE TABLE "public"."Clients" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "createdAt" Timestamp NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "name" varchar NOT NULL, "email" varchar NOT NULL, "phoneNumber" varchar, "street" varchar, "postalCode" varchar, "city" varchar, "province" varchar, "country" varchar, "organizationId" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("organizationId") REFERENCES "public"."Organizations"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("email"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updatedAt"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updatedAt" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_Clients_updatedAt"
BEFORE UPDATE ON "public"."Clients"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_Clients_updatedAt" ON "public"."Clients" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
