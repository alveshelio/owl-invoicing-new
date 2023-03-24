import { AppLayout } from '@/components';
import { Input, Combobox } from '@ui';

export default function NewInvoicePage() {
  return (
    <AppLayout>
      <div>Invoices</div>
      <div class="flex flex-col gap-4">
        <Combobox label="Select a section or create a new one" />
        <Input placeholder="xs input" size="xs" class="text-green-500" />
      </div>
    </AppLayout>
  );
}
