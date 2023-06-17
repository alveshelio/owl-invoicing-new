SET check_function_bodies = false;
CREATE FUNCTION public."set_current_timestamp_updatedAt"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updatedAt" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public."Categories" (
    value character varying NOT NULL
);
CREATE TABLE public."InvoiceSectionItems" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description text,
    quantity integer NOT NULL,
    price numeric NOT NULL,
    "sectionId" uuid NOT NULL
);
CREATE TABLE public."InvoiceSections" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name bpchar NOT NULL,
    category character varying NOT NULL,
    unit character varying NOT NULL,
    "invoiceId" uuid NOT NULL
);
CREATE TABLE public."InvoiceStatuses" (
    value character varying NOT NULL
);
CREATE TABLE public."Invoices" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    number integer NOT NULL,
    status character varying NOT NULL,
    "dueOn" date NOT NULL,
    "organizationId" uuid NOT NULL,
    "quotationId" uuid,
    amount numeric NOT NULL
);
CREATE TABLE public."Organizations" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name bpchar NOT NULL,
    street character varying NOT NULL,
    city character varying NOT NULL,
    "postalCode" character varying NOT NULL,
    "phoneNumberMobile" character varying,
    "phoneNumberLandLine" character varying,
    email character varying NOT NULL,
    "userId" bpchar
);
CREATE TABLE public."QuotationSectionItems" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description text,
    price numeric NOT NULL,
    quantity integer NOT NULL,
    "sectionId" uuid NOT NULL
);
CREATE TABLE public."QuotationSections" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    category character varying NOT NULL,
    unit character varying NOT NULL,
    "quotationId" uuid NOT NULL
);
CREATE TABLE public."QuotationStatuses" (
    value character varying NOT NULL
);
CREATE TABLE public."Quotations" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    number integer NOT NULL,
    status character varying NOT NULL,
    "validUntil" date NOT NULL,
    "organizationId" uuid NOT NULL
);
CREATE TABLE public."Roles" (
    value character varying NOT NULL
);
CREATE TABLE public."Stocks" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    category character varying NOT NULL,
    "organizationId" uuid NOT NULL
);
CREATE TABLE public."Units" (
    value character varying NOT NULL
);
CREATE TABLE public.authorizer_email_templates (
    key text,
    id character(36) NOT NULL,
    event_name text,
    subject text,
    template text,
    design text,
    created_at bigint,
    updated_at bigint
);
CREATE TABLE public.authorizer_envs (
    key text,
    id character(36) NOT NULL,
    env_data text,
    hash text,
    updated_at bigint,
    created_at bigint
);
CREATE TABLE public.authorizer_otps (
    key text,
    id character(36) NOT NULL,
    email text,
    otp text,
    expires_at bigint,
    created_at bigint,
    updated_at bigint
);
CREATE TABLE public.authorizer_sessions (
    key text,
    id character(36) NOT NULL,
    user_id character(36),
    user_agent text,
    ip text,
    created_at bigint,
    updated_at bigint
);
CREATE TABLE public.authorizer_users (
    key text,
    id character(36) NOT NULL,
    email text,
    email_verified_at bigint,
    password text,
    signup_methods text,
    given_name text,
    family_name text,
    middle_name text,
    nickname text,
    gender text,
    birthdate text,
    phone_number text,
    phone_number_verified_at bigint,
    picture text,
    roles text,
    revoked_timestamp bigint,
    is_multi_factor_auth_enabled boolean,
    updated_at bigint,
    created_at bigint
);
CREATE TABLE public.authorizer_verification_requests (
    key text,
    id character(36) NOT NULL,
    token text,
    identifier character varying(64),
    expires_at bigint,
    email character varying(256),
    nonce text,
    redirect_uri text,
    created_at bigint,
    updated_at bigint
);
CREATE TABLE public.authorizer_webhook_logs (
    key text,
    id character(36) NOT NULL,
    http_status bigint,
    response text,
    request text,
    webhook_id character(36),
    created_at bigint,
    updated_at bigint
);
CREATE TABLE public.authorizer_webhooks (
    key text,
    id character(36) NOT NULL,
    event_name text,
    end_point text,
    headers text,
    enabled boolean,
    created_at bigint,
    updated_at bigint
);
ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (value);
ALTER TABLE ONLY public."InvoiceSectionItems"
    ADD CONSTRAINT "InvoiceSectionItems_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."InvoiceSections"
    ADD CONSTRAINT "InvoiceSections_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."InvoiceStatuses"
    ADD CONSTRAINT "InvoiceStatuses_pkey" PRIMARY KEY (value);
ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Organizations"
    ADD CONSTRAINT "Organizations_email_key" UNIQUE (email);
ALTER TABLE ONLY public."Organizations"
    ADD CONSTRAINT "Organizations_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."QuotationSectionItems"
    ADD CONSTRAINT "QuotationSectionItems_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."QuotationSections"
    ADD CONSTRAINT "QuotationSections_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."QuotationStatuses"
    ADD CONSTRAINT "QuotationStatuses_pkey" PRIMARY KEY (value);
ALTER TABLE ONLY public."Quotations"
    ADD CONSTRAINT "Quotations_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (value);
ALTER TABLE ONLY public."Stocks"
    ADD CONSTRAINT "Stocks_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_pkey" PRIMARY KEY (value);
ALTER TABLE ONLY public.authorizer_email_templates
    ADD CONSTRAINT authorizer_email_templates_event_name_key UNIQUE (event_name);
ALTER TABLE ONLY public.authorizer_email_templates
    ADD CONSTRAINT authorizer_email_templates_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_envs
    ADD CONSTRAINT authorizer_envs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_otps
    ADD CONSTRAINT authorizer_otps_email_key UNIQUE (email);
ALTER TABLE ONLY public.authorizer_otps
    ADD CONSTRAINT authorizer_otps_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_sessions
    ADD CONSTRAINT authorizer_sessions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_users
    ADD CONSTRAINT authorizer_users_email_key UNIQUE (email);
ALTER TABLE ONLY public.authorizer_users
    ADD CONSTRAINT authorizer_users_phone_number_key UNIQUE (phone_number);
ALTER TABLE ONLY public.authorizer_users
    ADD CONSTRAINT authorizer_users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_verification_requests
    ADD CONSTRAINT authorizer_verification_requests_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_webhook_logs
    ADD CONSTRAINT authorizer_webhook_logs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.authorizer_webhooks
    ADD CONSTRAINT authorizer_webhooks_event_name_key UNIQUE (event_name);
ALTER TABLE ONLY public.authorizer_webhooks
    ADD CONSTRAINT authorizer_webhooks_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX idx_email_identifier ON public.authorizer_verification_requests USING btree (identifier, email);
CREATE TRIGGER "set_public_Categories_updatedAt" BEFORE UPDATE ON public."Categories" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_Categories_updatedAt" ON public."Categories" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_InvoiceSectionItems_updatedAt" BEFORE UPDATE ON public."InvoiceSectionItems" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_InvoiceSectionItems_updatedAt" ON public."InvoiceSectionItems" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_InvoiceSections_updatedAt" BEFORE UPDATE ON public."InvoiceSections" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_InvoiceSections_updatedAt" ON public."InvoiceSections" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_Invoices_updatedAt" BEFORE UPDATE ON public."Invoices" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_Invoices_updatedAt" ON public."Invoices" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_Organizations_updatedAt" BEFORE UPDATE ON public."Organizations" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_Organizations_updatedAt" ON public."Organizations" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_QuotationSectionItems_updatedAt" BEFORE UPDATE ON public."QuotationSectionItems" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_QuotationSectionItems_updatedAt" ON public."QuotationSectionItems" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_QuotationSections_updatedAt" BEFORE UPDATE ON public."QuotationSections" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_QuotationSections_updatedAt" ON public."QuotationSections" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_Quotations_updatedAt" BEFORE UPDATE ON public."Quotations" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_Quotations_updatedAt" ON public."Quotations" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_Stocks_updatedAt" BEFORE UPDATE ON public."Stocks" FOR EACH ROW EXECUTE FUNCTION public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_Stocks_updatedAt" ON public."Stocks" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
ALTER TABLE ONLY public."InvoiceSectionItems"
    ADD CONSTRAINT "InvoiceSectionItems_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES public."InvoiceSections"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."InvoiceSections"
    ADD CONSTRAINT "InvoiceSections_category_fkey" FOREIGN KEY (category) REFERENCES public."Categories"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."InvoiceSections"
    ADD CONSTRAINT "InvoiceSections_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES public."Invoices"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."InvoiceSections"
    ADD CONSTRAINT "InvoiceSections_unit_fkey" FOREIGN KEY (unit) REFERENCES public."Units"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES public."Organizations"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_quotationId_fkey" FOREIGN KEY ("quotationId") REFERENCES public."Quotations"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_status_fkey" FOREIGN KEY (status) REFERENCES public."InvoiceStatuses"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Organizations"
    ADD CONSTRAINT "Organizations_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.authorizer_users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."QuotationSectionItems"
    ADD CONSTRAINT "QuotationSectionItems_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES public."QuotationSections"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."QuotationSections"
    ADD CONSTRAINT "QuotationSections_category_fkey" FOREIGN KEY (category) REFERENCES public."Categories"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."QuotationSections"
    ADD CONSTRAINT "QuotationSections_quotationId_fkey" FOREIGN KEY ("quotationId") REFERENCES public."Quotations"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."QuotationSections"
    ADD CONSTRAINT "QuotationSections_unit_fkey" FOREIGN KEY (unit) REFERENCES public."Units"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Quotations"
    ADD CONSTRAINT "Quotations_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES public."Organizations"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Quotations"
    ADD CONSTRAINT "Quotations_status_fkey" FOREIGN KEY (status) REFERENCES public."QuotationStatuses"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Stocks"
    ADD CONSTRAINT "Stocks_category_fkey" FOREIGN KEY (category) REFERENCES public."Categories"(value) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."Stocks"
    ADD CONSTRAINT "Stocks_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES public."Organizations"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
