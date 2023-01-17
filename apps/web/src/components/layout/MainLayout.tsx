import { MainNavigation } from '@/components';
import { ParentComponent } from 'solid-js';

export const MainLayout: ParentComponent = (props) => (
  <div class="grid grid-cols-mainLayout">
    <aside class="text-cyan-50">
      <MainNavigation />
    </aside>
    <main>{props.children}</main>
  </div>
);
