// @refresh reload
import './root.css';

import { QueryClient, QueryClientProvider } from '@tanstack/solid-query';
import { Suspense } from 'solid-js';
import {
  Body,
  ErrorBoundary,
  FileRoutes,
  Head,
  Html,
  Meta,
  Routes,
  Scripts,
  Title,
} from 'solid-start';

import { AuthorizerProvider } from '@/contexts/AuthorizerContext';

export default function Root() {
  const queryClient = new QueryClient({
    defaultOptions: {
      queries: {
        refetchOnMount: true,
        staleTime: 1000,
      },
    },
  });
  return (
    <Html lang="en">
      <Head>
        <Title>
          SolidStart - Tanstack Query - Tailwind CSS - CSS Modules Kit
        </Title>
        <Meta charset="utf-8" />
        <Meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <Body>
        <AuthorizerProvider
          authorizerURL="http://localhost:3080"
          redirectURL={window.location.origin}
          clientID="c256dbaa-0052-454f-adf0-159f38544e2b"
        >
          <QueryClientProvider client={queryClient}>
            <Suspense>
              <ErrorBoundary>
                <Routes>
                  <FileRoutes />
                </Routes>
              </ErrorBoundary>
            </Suspense>
          </QueryClientProvider>
        </AuthorizerProvider>
        <Scripts />
      </Body>
    </Html>
  );
}
