import { AppLayout } from '@/components';
import { QueryDisplay } from '@/components/queryDisplay/QueryDisplay';
import { allInvoicesQuery } from '@/gql/queries/invoice/invoiceQueries';
import { Input } from '@/components/ui';

export default function InvoicesPage() {
  const { query } = allInvoicesQuery();
  return (
    <AppLayout>
      <div>Invoices</div>
      <QueryDisplay query={query} hasData={!!query.data?.invoices.length}>
        <div class="flex flex-col gap-4">
          <Input placeholder="xs input" size="xs" class="text-green-500" />
        </div>
      </QueryDisplay>
    </AppLayout>
  );
}
