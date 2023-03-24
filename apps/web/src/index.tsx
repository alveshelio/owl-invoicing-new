/* @refresh reload */
import { AuthorizerProvider } from '@/contexts/AuthorizerContext';
import { render } from 'solid-js/web';
import { Router } from '@solidjs/router';
import { QueryClientProvider } from '@tanstack/solid-query';
import { QueryClient } from '@tanstack/query-core';

import '@/index.css';
import { App } from '@/App';

const queryClient = new QueryClient();

render(
  () => (
    <AuthorizerProvider
      authorizerURL="http://localhost:3080"
      redirectURL={window.location.origin}
      clientID="dc7d8969-82a3-438d-a75e-bbeefe9ef94d"
    >
      <QueryClientProvider client={queryClient}>
        <Router>
          <App />
        </Router>
      </QueryClientProvider>
    </AuthorizerProvider>
  ),
  document.getElementById('root') as HTMLElement
);
