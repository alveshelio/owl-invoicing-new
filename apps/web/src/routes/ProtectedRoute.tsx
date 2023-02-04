import { getAuthorizer } from '@/contexts/AuthorizerContext';
import { Show } from 'solid-js';
import { Outlet } from '@solidjs/router';

export default function ProtectedRoute() {
  const [state] = getAuthorizer();

  return (
    <Show when={state.user && !state.loading} keyed={false}>
      <Outlet />
    </Show>
  );
}
