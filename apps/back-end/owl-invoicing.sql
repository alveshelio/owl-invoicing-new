--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
-- Dumped by pg_dump version 14.8 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: hdb_action_log; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_action_log (id, action_name, input_payload, request_headers, session_variables, response_payload, errors, created_at, response_received_at, status) FROM stdin;
\.


--
-- Data for Name: hdb_cron_events; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_cron_events (id, trigger_name, scheduled_time, status, tries, created_at, next_retry_at) FROM stdin;
\.


--
-- Data for Name: hdb_cron_event_invocation_logs; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_cron_event_invocation_logs (id, event_id, status, request, response, created_at) FROM stdin;
\.


--
-- Data for Name: hdb_metadata; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_metadata (id, metadata, resource_version) FROM stdin;
1	{"sources":[{"configuration":{"connection_info":{"database_url":{"from_env":"PG_DATABASE_URL"},"isolation_level":"read-committed","use_prepared_statements":false}},"kind":"postgres","name":"default","tables":[{"array_relationships":[{"name":"InvoiceSections","using":{"foreign_key_constraint_on":{"column":"categoryId","table":{"name":"InvoiceSections","schema":"public"}}}},{"name":"QuotationSections","using":{"foreign_key_constraint_on":{"column":"categoryId","table":{"name":"QuotationSections","schema":"public"}}}}],"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["created_at","id","organizationId","updated_at","value"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}}],"select_permissions":[{"permission":{"columns":["value","created_at","updated_at","id","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"InvoiceQuotationCategories","schema":"public"},"update_permissions":[{"permission":{"check":null,"columns":["updated_at","value"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteInvoiceSectionItems","delete_by_pk":"deleteInvoiceSectionItem","insert":"insertInvoiceSectionItems","insert_one":"insertInvoiceSectionItem","select":"invoiceSectionItems","select_aggregate":"invoiceSectionItemsAggregate","select_by_pk":"invoiceSectionItem","select_stream":"invoiceSectionItemsStream","update":"updateInvoiceSectionItems","update_by_pk":"updateInvoiceSectionItem","update_many":"updateManyInvoiceSectionItems"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["name","quantity","price","description","createdAt","updatedAt","id","organizationId","sectionId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"InvoiceSection","using":{"foreign_key_constraint_on":"sectionId"}},{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}}],"select_permissions":[{"permission":{"columns":["name","quantity","price","description","createdAt","updatedAt","id","organizationId","sectionId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"InvoiceSectionItems","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["description","name","price","quantity","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"InvoiceSectionItems","using":{"foreign_key_constraint_on":{"column":"sectionId","table":{"name":"InvoiceSectionItems","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteInvoiceSections","delete_by_pk":"deleteInvoiceSection","insert":"insertInvoiceSections","insert_one":"insertInvoiceSection","select":"invoiceSections","select_aggregate":"invoiceSectionsAggregate","select_by_pk":"invoiceSection","select_stream":"invoiceSectionsStream","update":"updateInvoiceSections","update_by_pk":"updateInvoiceSection","update_many":"updateManyInvoiceSections"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["name","unit","createdAt","updatedAt","categoryId","id","invoiceId","organizationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Category","using":{"manual_configuration":{"column_mapping":{"categoryId":"id"},"insertion_order":null,"remote_table":{"name":"InvoiceQuotationCategories","schema":"public"}}}},{"name":"Invoice","using":{"foreign_key_constraint_on":"invoiceId"}},{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}},{"name":"Unit","using":{"foreign_key_constraint_on":"unit"}}],"select_permissions":[{"permission":{"columns":["name","unit","createdAt","updatedAt","categoryId","id","invoiceId","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"InvoiceSections","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["categoryId","name","unit","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"Invoices","using":{"foreign_key_constraint_on":{"column":"status","table":{"name":"Invoices","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteInvoiceStatuses","delete_by_pk":"deleteInvoiceStatus","insert":"insertInvoiceStatuses","insert_one":"insertInvoiceStatus","select":"invoiceStatuses","select_aggregate":"invoiceStatusesAggregate","select_by_pk":"invoiceStatus","select_stream":"invoiceStatusesStream","update":"updateInvoiceStatuses","update_by_pk":"updateInvoiceStatus","update_many":"updateManyInvoiceStatuses"}},"select_permissions":[{"permission":{"columns":["value"],"filter":{"_exists":{"_table":{"name":"authorizer_users","schema":"public"},"_where":{"id":{"_eq":"X-Hasura-User-Id"}}}}},"role":"organizationAdmin"}],"table":{"name":"InvoiceStatuses","schema":"public"}},{"array_relationships":[{"name":"InvoiceSections","using":{"foreign_key_constraint_on":{"column":"invoiceId","table":{"name":"InvoiceSections","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteInvoices","delete_by_pk":"deleteInvoice","insert":"insertInvoices","insert_one":"insertInvoice","select":"invoices","select_aggregate":"invoicesAggregate","select_by_pk":"invoice","select_stream":"invoicesStream","update":"updateInvoices","update_by_pk":"updateInvoice","update_many":"updateManyInvoices"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["amount","clientId","createdAt","dueOn","id","number","organizationId","quotationId","status","updatedAt"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Client","using":{"manual_configuration":{"column_mapping":{"clientId":"id"},"insertion_order":null,"remote_table":{"name":"OrganizationClients","schema":"public"}}}},{"name":"InvoiceStatus","using":{"foreign_key_constraint_on":"status"}},{"name":"Organization","using":{"foreign_key_constraint_on":"organizationId"}},{"name":"Quotation","using":{"foreign_key_constraint_on":"quotationId"}}],"select_permissions":[{"permission":{"columns":["amount","clientId","createdAt","dueOn","id","number","organizationId","quotationId","status","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"Invoices","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["amount","dueOn","number","status","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"Invoices","using":{"manual_configuration":{"column_mapping":{"id":"clientId"},"insertion_order":null,"remote_table":{"name":"Invoices","schema":"public"}}}},{"name":"Quotations","using":{"manual_configuration":{"column_mapping":{"id":"clientId"},"insertion_order":null,"remote_table":{"name":"Quotations","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteClients","delete_by_pk":"deleteClient","insert":"insertClients","insert_one":"insertClient","select":"clients","select_aggregate":"clientsAggregate","select_by_pk":"client","select_stream":"clientsStream","update":"updateClients","update_by_pk":"updateClient","update_many":"updateManyClients"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["city","country","email","name","phoneNumberMobile","postalCode","state","street","createdAt","updatedAt","id","organizationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Organization","using":{"foreign_key_constraint_on":"organizationId"}}],"select_permissions":[{"permission":{"columns":["city","country","email","name","phoneNumberMobile","postalCode","state","street","createdAt","updatedAt","id","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"OrganizationClients","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["city","country","email","name","phoneNumberMobile","postalCode","state","street"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"Clients","using":{"foreign_key_constraint_on":{"column":"organizationId","table":{"name":"OrganizationClients","schema":"public"}}}},{"name":"Invoices","using":{"foreign_key_constraint_on":{"column":"organizationId","table":{"name":"Invoices","schema":"public"}}}},{"name":"Quotations","using":{"foreign_key_constraint_on":{"column":"organizationId","table":{"name":"Quotations","schema":"public"}}}},{"name":"Stocks","using":{"foreign_key_constraint_on":{"column":"organizationId","table":{"name":"Stocks","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteOrganizations","delete_by_pk":"deleteOrganization","insert":"insertOrganizations","insert_one":"insertOrganization","select":"organizations","select_aggregate":"organizationsAggreate","select_by_pk":"organization","select_stream":"organizationsStream","update":"updateOrganizations","update_by_pk":"updateOrganization","update_many":"updateManyOrganizations"}},"insert_permissions":[{"permission":{"check":{"userId":{"_eq":"X-Hasura-User-Id"}},"columns":["city","createdAt","email","id","name","phoneNumberLandLine","phoneNumberMobile","postalCode","state","street","updatedAt","userId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"authorizer_user","using":{"foreign_key_constraint_on":"userId"}}],"select_permissions":[{"permission":{"columns":["city","createdAt","email","id","name","phoneNumberLandLine","phoneNumberMobile","postalCode","state","street","updatedAt","userId"],"filter":{"userId":{"_eq":"X-Hasura-User-Id"}}},"role":"organizationAdmin"}],"table":{"name":"Organizations","schema":"public"},"update_permissions":[{"permission":{"check":{"userId":{"_eq":"X-Hasura-User-Id"}},"columns":["city","email","name","phoneNumberLandLine","phoneNumberMobile","postalCode","state","street","updatedAt"],"filter":{"userId":{"_eq":"X-Hasura-User-Id"}}},"role":"organizationAdmin"}]},{"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteOquotationSectionItems","delete_by_pk":"deleteOquotationSectionItem","insert":"inserOquotationSectionItems","insert_one":"insertOquotationSectionItem","select":"quotationSectionItems","select_aggregate":"quotationSectionItemsAggregate","select_by_pk":"quotationSectionItem","select_stream":"quotationSectionItemsStream","update":"updateOquotationSectionItems","update_by_pk":"updateOquotationSectionItem","update_many":"updateManyOquotationSectionItems"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["name","quantity","price","description","createdAt","updatedAt","id","organizationId","sectionId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}},{"name":"QuotationSection","using":{"foreign_key_constraint_on":"sectionId"}}],"select_permissions":[{"permission":{"columns":["name","quantity","price","description","createdAt","updatedAt","id","organizationId","sectionId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"QuotationSectionItems","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["description","name","price","quantity","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"QuotationSectionItems","using":{"foreign_key_constraint_on":{"column":"sectionId","table":{"name":"QuotationSectionItems","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteQuotationSections","delete_by_pk":"deleteQuotationSection","insert":"insertQuotationSections","insert_one":"insertQuotationSection","select":"quotationSections","select_aggregate":"quotationSectionsAggregate","select_by_pk":"quotationSection","select_stream":"quotationSectionsStream","update":"updateQuotationSections","update_by_pk":"updateQuotationSection","update_many":"updateManyQuotationSections"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["name","unit","createdAt","updatedAt","categoryId","id","organizationId","quotationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Category","using":{"manual_configuration":{"column_mapping":{"categoryId":"id"},"insertion_order":null,"remote_table":{"name":"InvoiceQuotationCategories","schema":"public"}}}},{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}},{"name":"Quotation","using":{"foreign_key_constraint_on":"quotationId"}},{"name":"Unit","using":{"foreign_key_constraint_on":"unit"}}],"select_permissions":[{"permission":{"columns":["name","unit","createdAt","updatedAt","categoryId","id","organizationId","quotationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"QuotationSections","schema":"public"},"update_permissions":[{"permission":{"check":null,"columns":["categoryId","name","unit","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"Quotations","using":{"foreign_key_constraint_on":{"column":"status","table":{"name":"Quotations","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteQuotationStatuses","delete_by_pk":"deleteQuotationStatus","insert":"insertQuotationStatuses","insert_one":"insertQuotationStatus","select":"quotationStatuses","select_aggregate":"quotationStatusesAggregate","select_by_pk":"quotationStatus","select_stream":"quotationStatusesStream","update":"updateQuotationStatuses","update_by_pk":"updateQuotationStatus","update_many":"updateManyQuotationStatuses"}},"select_permissions":[{"permission":{"columns":["value"],"filter":{"_exists":{"_table":{"name":"authorizer_users","schema":"public"},"_where":{"id":{"_eq":"X-Hasura-User-Id"}}}}},"role":"organizationAdmin"}],"table":{"name":"QuotationStatuses","schema":"public"}},{"array_relationships":[{"name":"Invoices","using":{"foreign_key_constraint_on":{"column":"quotationId","table":{"name":"Invoices","schema":"public"}}}},{"name":"QuotationSections","using":{"foreign_key_constraint_on":{"column":"quotationId","table":{"name":"QuotationSections","schema":"public"}}}}],"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteQuotations","delete_by_pk":"deleteQuotation","insert":"insertQuotations","insert_one":"insertQuotation","select":"quotations","select_aggregate":"quotationsAggregate","select_by_pk":"quotation","select_stream":"quotationsStream","update":"updateQuotations","update_by_pk":"updateQuotation","update_many":"updateManyQuotations"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["status","validUntil","number","createdAt","updatedAt","id","organizationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Client","using":{"manual_configuration":{"column_mapping":{"clientId":"id"},"insertion_order":null,"remote_table":{"name":"OrganizationClients","schema":"public"}}}},{"name":"Organization","using":{"foreign_key_constraint_on":"organizationId"}},{"name":"QuotationStatus","using":{"foreign_key_constraint_on":"status"}}],"select_permissions":[{"permission":{"columns":["status","validUntil","number","createdAt","updatedAt","id","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"Quotations","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["number","status","updatedAt","validUntil"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteRoles","delete_by_pk":"deleteRole","insert":"insertRoles","insert_one":"insertRole","select":"roles","select_aggregate":"rolesAggregate","select_by_pk":"role","select_stream":"rolesStream","update":"updateRoles","update_by_pk":"updateRole","update_many":"updateManyRoles"}},"table":{"name":"Roles","schema":"public"}},{"array_relationships":[{"name":"Stocks","using":{"foreign_key_constraint_on":{"column":"categoryId","table":{"name":"Stocks","schema":"public"}}}}],"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["value","id","organizationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}}],"select_permissions":[{"permission":{"columns":["value","id","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"StockCategories","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["value"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"configuration":{"column_config":{},"custom_column_names":{},"custom_root_fields":{"delete":"deleteStocks","delete_by_pk":"deleteStock","insert":"insertStocks","insert_one":"insertStock","select":"stocks","select_aggregate":"stocksAggregate","select_by_pk":"stock","select_stream":"stocksStream","update":"updateStocks","update_by_pk":"updateStock","update_many":"updateManyStocks"}},"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["name","unit","pricePerUnit","createdAt","updatedAt","categoryId","id","organizationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Category","using":{"manual_configuration":{"column_mapping":{"categoryId":"id"},"insertion_order":null,"remote_table":{"name":"StockCategories","schema":"public"}}}},{"name":"Organization","using":{"foreign_key_constraint_on":"organizationId"}}],"select_permissions":[{"permission":{"columns":["name","unit","pricePerUnit","createdAt","updatedAt","categoryId","id","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"Stocks","schema":"public"},"update_permissions":[{"permission":{"check":null,"columns":["categoryId","name","pricePerUnit","unit","updatedAt"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"array_relationships":[{"name":"InvoiceSections","using":{"foreign_key_constraint_on":{"column":"unit","table":{"name":"InvoiceSections","schema":"public"}}}},{"name":"QuotationSections","using":{"foreign_key_constraint_on":{"column":"unit","table":{"name":"QuotationSections","schema":"public"}}}}],"delete_permissions":[{"permission":{"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"insert_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["value","organizationId"]},"role":"organizationAdmin"}],"object_relationships":[{"name":"Organization","using":{"manual_configuration":{"column_mapping":{"organizationId":"id"},"insertion_order":null,"remote_table":{"name":"Organizations","schema":"public"}}}}],"select_permissions":[{"permission":{"columns":["value","organizationId"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}],"table":{"name":"Units","schema":"public"},"update_permissions":[{"permission":{"check":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}},"columns":["value"],"filter":{"Organization":{"userId":{"_eq":"X-Hasura-User-Id"}}}},"role":"organizationAdmin"}]},{"table":{"name":"authorizer_email_templates","schema":"public"}},{"table":{"name":"authorizer_envs","schema":"public"}},{"table":{"name":"authorizer_otps","schema":"public"}},{"table":{"name":"authorizer_sessions","schema":"public"}},{"array_relationships":[{"name":"Organizations","using":{"foreign_key_constraint_on":{"column":"userId","table":{"name":"Organizations","schema":"public"}}}}],"select_permissions":[{"permission":{"columns":["created_at","email_verified_at","phone_number_verified_at","revoked_timestamp","updated_at","is_multi_factor_auth_enabled","id","birthdate","email","family_name","gender","given_name","key","middle_name","nickname","password","phone_number","picture","roles","signup_methods"],"filter":{"id":{"_eq":"X-Hasura-User-Id"}}},"role":"organizationAdmin"}],"table":{"name":"authorizer_users","schema":"public"},"update_permissions":[{"permission":{"check":null,"columns":["birthdate","email","family_name","gender","given_name","middle_name","nickname","phone_number","picture","updated_at"],"filter":{"id":{"_eq":"X-Hasura-User-Id"}}},"role":"organizationAdmin"}]},{"table":{"name":"authorizer_verification_requests","schema":"public"}},{"table":{"name":"authorizer_webhook_logs","schema":"public"}},{"table":{"name":"authorizer_webhooks","schema":"public"}}]}],"version":3}	150
\.


--
-- Data for Name: hdb_scheduled_events; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_scheduled_events (id, webhook_conf, scheduled_time, retry_conf, payload, header_conf, status, tries, created_at, next_retry_at, comment) FROM stdin;
\.


--
-- Data for Name: hdb_scheduled_event_invocation_logs; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_scheduled_event_invocation_logs (id, event_id, status, request, response, created_at) FROM stdin;
\.


--
-- Data for Name: hdb_schema_notifications; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_schema_notifications (id, notification, resource_version, instance_id, updated_at) FROM stdin;
1	{"metadata":false,"remote_schemas":[],"sources":["default"],"data_connectors":[]}	150	2dfcc9a3-d095-46ad-a2c1-94be1c311477	2023-01-15 22:34:42.243636+00
\.


--
-- Data for Name: hdb_version; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_version (hasura_uuid, version, upgraded_on, cli_state, console_state) FROM stdin;
59af0fd9-3a1e-46f1-87b2-513da3e05bb4	47	2023-01-15 22:32:07.448173+00	{"settings": {"migration_mode": "true"}, "migrations": {"default": {"1663632781706": false, "1663633472755": false, "1663633518703": false, "1663633577428": false, "1676087619584": false, "1676087992068": false, "1676088015076": false, "1676088032218": false, "1676088053839": false, "1676088071587": false, "1676088132286": false, "1676088160064": false, "1676088603474": false, "1676088622749": false, "1676088634734": false, "1676088652526": false, "1676088727277": false, "1676088965724": false, "1676088987341": false, "1676089017407": false, "1676089035122": false, "1676089174914": false, "1676089221391": false, "1676089401989": false, "1676089448266": false, "1676089464823": false, "1676089493385": false, "1676089506621": false, "1676089526326": false, "1676089535608": false, "1676247537971": false, "1676247560155": false, "1676252092372": false, "1676252198820": false, "1676252220878": false, "1676252262039": false, "1677302313548": false, "1677302415701": false, "1677303547745": false, "1677458336279": false, "1677949408218": false, "1677950265947": false, "1677950441943": false, "1677950466551": false, "1678567190076": false, "1678567209241": false, "1678567245099": false, "1678567257558": false, "1687007932082": false, "1687007968218": false}}, "isStateCopyCompleted": true}	{"console_notifications": {"admin": {"date": "2023-03-11T20:31:38.505Z", "read": ["240"], "showBadge": false}}, "telemetryNotificationShown": true}
\.


--
-- Data for Name: InvoiceQuotationCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InvoiceQuotationCategories" (id, created_at, updated_at, value, "organizationId") FROM stdin;
\.


--
-- Data for Name: InvoiceStatuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InvoiceStatuses" (value) FROM stdin;
PAID
UNPAID
CANCELED
PARTIAL
\.


--
-- Data for Name: authorizer_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_users (key, id, email, email_verified_at, password, signup_methods, given_name, family_name, middle_name, nickname, gender, birthdate, phone_number, phone_number_verified_at, picture, roles, revoked_timestamp, is_multi_factor_auth_enabled, updated_at, created_at) FROM stdin;
66724279-d944-4451-b533-0b9946048a61	66724279-d944-4451-b533-0b9946048a61	helios25+10@gmail.com	1677424321	$2a$10$87jzxvFb/j3LXm1KWBhvJO9BnpGkwrpawg5hBGmaK08YkFRsO3Upu	basic_auth	\N	\N	\N	\N	\N	\N	\N	\N	\N	organizationAdmin,user	\N	\N	1677424321	1677424262
7e2a20b6-b1fa-459c-936a-ad191aa7368d	7e2a20b6-b1fa-459c-936a-ad191aa7368d	helios25+11@gmail.com	1677424321	$2a$10$0hfIBkC6LV/zl2Xe5CuWeehUIv85Upxx4xSDV3mW/l.4Jabz7drPW	basic_auth	\N	\N	\N	\N	\N	\N	\N	\N	\N	organizationAdmin,user	\N	\N	1677423627	1677423627
dc8f0967-b9d5-44ea-95a3-a502a89db9d2	dc8f0967-b9d5-44ea-95a3-a502a89db9d2	helios25+5@gmail.com	1677285966	$2a$10$3Ow1u9QPX3V7my55oxdCMuOiNd/rZVvGzIvNupopb5KkfjovSkRVi	basic_auth	\N	\N	\N	\N	\N	\N	\N	\N	\N	organizationAdmin,user	\N	\N	1677285966	1677285946
\.


--
-- Data for Name: Organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Organizations" (id, "createdAt", "updatedAt", name, street, city, "postalCode", "phoneNumberMobile", "phoneNumberLandLine", email, "userId", state) FROM stdin;
0991484a-3222-49ea-b73d-33733a684d1f	2023-02-25 05:41:10.336685	2023-02-25 05:41:10.336685	Org for helios25+5	11 Road Runner	MTL	HB0 223	\N	\N	helios25+55	dc8f0967-b9d5-44ea-95a3-a502a89db9d2	\N
bc7e8a35-ef91-4c68-b13d-5170da1c72db	2023-02-26 17:41:11.474764	2023-03-11 16:11:08.065566	Org for helios25+10	11 Road Runner	MTL	HB0 223	\N	\N	helios25+111@gmail.com	66724279-d944-4451-b533-0b9946048a61	\N
a456fdfc-9ef6-4b24-882d-919d92fa78d6	2023-03-11 20:32:35.807709	2023-03-11 20:32:35.807709	Organization for user helios25+11	11931 Suzor-Cote	Montreal	H3M 2J3	5145314834		helios25+1122@gmail.com	7e2a20b6-b1fa-459c-936a-ad191aa7368d	Québec
\.


--
-- Data for Name: OrganizationClients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrganizationClients" (id, "createdAt", "updatedAt", name, email, "phoneNumberMobile", street, "postalCode", city, state, country, "organizationId", "phoneNumberLandLine") FROM stdin;
\.


--
-- Data for Name: QuotationStatuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."QuotationStatuses" (value) FROM stdin;
ACCEPTED
REFUSED
\.


--
-- Data for Name: Quotations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Quotations" (id, "createdAt", "updatedAt", number, status, "validUntil", "organizationId", "clientId", sent, viewed) FROM stdin;
\.


--
-- Data for Name: Invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Invoices" (id, "createdAt", "updatedAt", number, status, "dueOn", "organizationId", "quotationId", amount, "clientId", sent, viewed) FROM stdin;
\.


--
-- Data for Name: Units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Units" (value, "organizationId") FROM stdin;
\.


--
-- Data for Name: InvoiceSections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InvoiceSections" (id, "createdAt", "updatedAt", name, unit, "invoiceId", "organizationId", "categoryId") FROM stdin;
\.


--
-- Data for Name: InvoiceSectionItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InvoiceSectionItems" (id, "createdAt", "updatedAt", name, description, quantity, price, "sectionId", "organizationId") FROM stdin;
\.


--
-- Data for Name: QuotationSections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."QuotationSections" (id, "createdAt", "updatedAt", name, unit, "quotationId", "organizationId", "categoryId") FROM stdin;
\.


--
-- Data for Name: QuotationSectionItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."QuotationSectionItems" (id, "createdAt", "updatedAt", name, description, price, quantity, "sectionId", "organizationId") FROM stdin;
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Roles" (value) FROM stdin;
user
organizationAdmin
\.


--
-- Data for Name: StockCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."StockCategories" (value, id, "organizationId") FROM stdin;
\.


--
-- Data for Name: Stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Stocks" (id, "createdAt", "updatedAt", name, "organizationId", "categoryId", unit, "pricePerUnit") FROM stdin;
\.


--
-- Data for Name: authorizer_email_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_email_templates (key, id, event_name, subject, template, design, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: authorizer_envs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_envs (key, id, env_data, hash, updated_at, created_at, encryption_key) FROM stdin;
e89b9fb0-45f4-4504-8e2f-d4649d9a8570	e89b9fb0-45f4-4504-8e2f-d4649d9a8570	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	1677424107	1674621848	
\.


--
-- Data for Name: authorizer_otps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_otps (key, id, email, otp, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: authorizer_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_sessions (key, id, user_id, user_agent, ip, created_at, updated_at) FROM stdin;
18d4d21e-f953-469b-a485-d37255b24846	18d4d21e-f953-469b-a485-d37255b24846	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:62716	1677424321	1677424321
d55992ec-70fd-4a63-b1e1-a070aadca76c	d55992ec-70fd-4a63-b1e1-a070aadca76c	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:57866	1678551127	1678551127
9570d8fc-75a1-4bad-b571-7c9580564891	9570d8fc-75a1-4bad-b571-7c9580564891	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:57866	1678551228	1678551228
3006e8d7-8e98-4853-846c-c2b6c9911e79	3006e8d7-8e98-4853-846c-c2b6c9911e79	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:53750	1678551881	1678551881
5be1c6c9-8a22-42cc-bf09-a525ad8fca48	5be1c6c9-8a22-42cc-bf09-a525ad8fca48	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:39418	1678551946	1678551946
c96aa304-093a-4a2c-8307-c1b2e9684aa8	c96aa304-093a-4a2c-8307-c1b2e9684aa8	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:39418	1678552130	1678552130
677294e9-7eb0-4f18-8cbd-dd6aadb030a5	677294e9-7eb0-4f18-8cbd-dd6aadb030a5	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:39418	1678552255	1678552255
dfa0d6d2-4993-441b-9125-94d0f6aed68f	dfa0d6d2-4993-441b-9125-94d0f6aed68f	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:39418	1678552428	1678552428
689bfbbe-ec39-4eab-b258-959276d6b70d	689bfbbe-ec39-4eab-b258-959276d6b70d	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:40644	1678559088	1678559088
a88b16ec-ab2a-4eae-9459-2ac00ef797f3	a88b16ec-ab2a-4eae-9459-2ac00ef797f3	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:58088	1678559182	1678559182
d6c42a4b-afd0-4b07-97ea-5a7af07faee8	d6c42a4b-afd0-4b07-97ea-5a7af07faee8	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:40214	1678560135	1678560135
968369ad-1630-4df0-96ef-a51e8f56abf3	968369ad-1630-4df0-96ef-a51e8f56abf3	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:39202	1678560361	1678560361
90f7e59c-de1c-4c2b-8e30-28007cd59371	90f7e59c-de1c-4c2b-8e30-28007cd59371	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:50636	1678560892	1678560892
78969906-e09b-4bf0-a81d-3ef451b8209e	78969906-e09b-4bf0-a81d-3ef451b8209e	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:50636	1678562003	1678562003
27db7b47-1e67-4a5a-a474-3fb5f9f695cc	27db7b47-1e67-4a5a-a474-3fb5f9f695cc	66724279-d944-4451-b533-0b9946048a61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:50636	1678562031	1678562031
c0a088f6-6ad4-4803-b4b9-f5b093ff089b	c0a088f6-6ad4-4803-b4b9-f5b093ff089b	7e2a20b6-b1fa-459c-936a-ad191aa7368d	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36	172.18.0.1:37178	1678563957	1678563957
9e89a2ea-f9c3-44cf-bac4-f6080d4a05e4	9e89a2ea-f9c3-44cf-bac4-f6080d4a05e4	7e2a20b6-b1fa-459c-936a-ad191aa7368d	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36	172.18.0.1:51614	1679249900	1679249900
\.


--
-- Data for Name: authorizer_verification_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_verification_requests (key, id, token, identifier, expires_at, email, nonce, redirect_uri, created_at, updated_at) FROM stdin;
91a50e1e-b655-465a-956f-3df183abad6d	91a50e1e-b655-465a-956f-3df183abad6d	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIzZGYzYzg0My01MDc1LTQ4ZTQtODY1Zi1jMzQxMTI3YzJjM2YiLCJleHAiOjE2Nzc0MjU0MjcsImlhdCI6MTY3NzQyMzYyNywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDozMDgwIiwibm9uY2UiOiJCSDUwejBicHJwb0Y2ZWVmZVBTYzhEQTMxZERDQ2ordXJyZVRSVUZpK09jSE52YlkiLCJyZWRpcmVjdF91cmkiOiJodHRwOi8vbG9jYWxob3N0OjMwMDAiLCJzdWIiOiJoZWxpb3MyNSsxMUBnbWFpbC5jb20iLCJ0b2tlbl90eXBlIjoiYmFzaWNfYXV0aF9zaWdudXAifQ.IP5h5pYhLvvPdjD9F4hXuhmz5j447KPP5O3jPwTR_o2YzuLxikqt7WdyOLgTIHDvD9Dm-Sx6AnhUgHsyRzp91Ohr6kClXvt1P2Jt_OPwa0e-XkAEwkEVmAg0f_x7bJCu_rlbAwQB4yy7aqvgpvUwrNmfbZimktVwf7rXUh5x6DGl4Y9VBtsg6rGx2Nf9bXdzeLrFF5FbNYpAmD-kGDOqCr4T303oJOgywCOaMfljrLXxzQMk7HXjNCwuXqFJQXm4L6jAkQDU9vAMeSngtWgjH_zcMRtAxNsdM0Fz2_3rDJmkIiGEkxUVr3YWGtkIvd5HDJEibGAKlEzT8EyOuCL68w	basic_auth_signup	1677425427	helios25+11@gmail.com	BH50z0bprpoF6eefePSc8DA31dDCCj+urreTRUFi+OcHNvbY	http://localhost:3000	1677423627	1677423627
\.


--
-- Data for Name: authorizer_webhook_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_webhook_logs (key, id, http_status, response, request, webhook_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: authorizer_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorizer_webhooks (key, id, event_name, end_point, headers, enabled, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

