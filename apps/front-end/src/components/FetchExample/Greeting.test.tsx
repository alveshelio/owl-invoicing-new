import 'whatwg-fetch';

import { Router } from '@solidjs/router';
import { render } from '@solidjs/testing-library';
import { QueryClient, QueryClientProvider } from '@tanstack/solid-query';
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
} from 'vitest';

import { Greeting } from '@/components/FetchExample/Greeting';
import { server } from '@/mock/serverSetup';

beforeAll(() => server.listen());
afterAll(() => server.close());
afterEach(() => server.resetHandlers());

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnMount: true,
      staleTime: 1000,
    },
  },
});

describe('Greeting', () => {
  let wrapper: any;
  beforeEach(() => {
    wrapper = render(() => (
      <QueryClientProvider client={queryClient}>
        <Router>
          <Greeting />
        </Router>
      </QueryClientProvider>
    ));
  });
  it('should mount', async () => {
    expect(wrapper).toBeTruthy();
  });

  it('should show the mocked greeting', async () => {
    expect(
      await wrapper.findByText('Hi Learners from This Dot Labs!')
    ).toBeTruthy();
  });
});
