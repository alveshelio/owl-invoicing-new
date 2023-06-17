                               #Tables
- Categories
- Invoices
- InvoiceSections
- InvoiceSectionItems
- InvoiceStatuses
- Organizations
- Quotations
- QuotationSections
- QuotationSectionItems
- QuotationStatuses
- Roles
- Stocks
- Units

---


#Categories
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- value

## Relationships
- InvoiceSection (Array)
- QuotationSection (Array)
- Stocks (Array)

---

# Invoices
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- number integer
- status charVarying
- dueOn
- organizationId
- quotationId
- amount

## FK
- organizationId - Organizations.id
- quotationId - Quotations.id
- status - InvoiceStatuses.value

## Relationship
- Organization (Object)
- Quotation  (Object)
- Status (Object)
- Sections (Array)

---

# InvoiceSections
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- name (charVarying)
- category (uuid)
- unit (charVarying)
- invoiceId (uuid)

## FK
- category - Categories.value
- invoiceIdd - Invoices.id
- unit - Units.value

## Relationship
- Category (Object)
- Invoice (Object)
- Items (Array)

---

# InvoiceSectionItems
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- name (charVarying)
- description (text)
- quantity (integer)
- price (numeric)
- sectionId (uuid)

## FK
- sectionId - InvoiceSections.id

## Relationship
- Section (Object)

---

# InvoiceStatuses
## Fields
- value (charVarying)

---

# Organizations
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- name (charVarying)
- street (charVarying)
- city (charVarying)
- postalCode (charVarying)
- phoneNumberMobile (charVarying) (nullable)
- phoneNumberLandLine (charVarying) (nullable)
- email (charVarying) (unique)
- userId

## FK
- userid - authorize.user.id

## Relationship
- Stock (Object)
- User (Object)
- Invoices (Array)
- Quotations (Array)

---

# Quotations
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- number (integer)
- status (charVarying)
- validUntil (Date)
- organizationId (uuid)
- invoiceId (uuid)
- amount (Numeric)

## FK
- organizationId - Organizations.id
- invoiceId - Invoices.id
- status - QuotationStatuses.value

## Relationship
- Organization (Object)
- Invoices (Array)
- Sections (Array)

---

# QuotationSections
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- name (charVarying)
- category (charVarying)
- unit (charVarying)
- quotationId (uuid)

## FK
- category - Categories.value
- invoiceIdd - Invoices.id
- unit - Units.value

## Relations
- Category (Object)
- Quotation (Object)
- Items (Array)

---

# QuotationSectionItems
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- name (charVarying)
- description (text)
- quantity (integer)
- price (numeric)
- sectionId (uuid)

## FK
- sectionId - QuotationSections.id

## Relationship
- Section (Object)

---

# QuotationStatuses
## Fields
- value (charVarying)

# Roles
## Fields
- value (charVarying)

## Relationship
- Users (Array)

---

# Stocks
## Fields
- id (uuid)
- createdAt (timestamp with tz)
- updatedAt (timestamp with tz)
- name (charVarying)
- quantity (integer)
- price (numeric)
- category (charVarying)
- organizationId (uuid)

## FK
- category - Categories.value
- organizationId - Organizations.id

## Unique Keys
- organizationId

## Relationship
- Category (Object)
- Organization (Object)
