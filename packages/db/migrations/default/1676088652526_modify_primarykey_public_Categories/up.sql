BEGIN TRANSACTION;
ALTER TABLE "public"."Categories" DROP CONSTRAINT "Categories_pkey";

ALTER TABLE "public"."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
