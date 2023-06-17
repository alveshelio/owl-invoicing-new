import { AuthorizerProvider } from '@/contexts/AuthorizerContext';
import { Route, Router, Routes } from '@solidjs/router';
import { ParentComponent } from 'solid-js';
import { QueryClient, QueryClientProvider } from '@tanstack/solid-query';

import '../src/index.css';

export const Wrapper: ParentComponent = (props) => {
  const queryClient = new QueryClient();

  return (
    <AuthorizerProvider
      authorizerURL="http://localhost:3080"
      redirectURL={window.location.origin}
      clientID="dc7d8969-82a3-438d-a75e-bbeefe9ef94d"
    >
      <QueryClientProvider client={queryClient}>
        <Router>
          <Routes>
            <Route path="/*" component={() => props.children} />
          </Routes>
        </Router>
      </QueryClientProvider>
    </AuthorizerProvider>
  );
};
