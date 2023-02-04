import { AppNavigation } from '@/components';
import { ParentComponent } from 'solid-js';

export const AppLayout: ParentComponent = (props) => (
  <div class="grid grid-cols-mainLayout">
    <aside class="text-cyan-50">
      <AppNavigation />
    </aside>
    <main>{props.children}</main>
  </div>
);
