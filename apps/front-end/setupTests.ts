import matchers from '@testing-library/jest-dom/matchers';
import { afterAll, afterEach, beforeAll, expect } from 'vitest';

import { server } from '@/mocks/serverSetup';

expect.extend(matchers);

beforeAll(() => {
  server.listen({
    onUnhandledRequest: 'warn',
  });
});

afterEach(() => {
  server.resetHandlers();
});

afterAll(() => {
  server.close();
});
