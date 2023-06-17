/// <reference types="vitest" />
/// <reference types="vite/client" />

import solid from 'solid-start/vite';
import { defineConfig } from 'vite';
import svgr from 'vite-plugin-svgr';
import tsconfigPaths from 'vite-tsconfig-paths';

export default defineConfig({
  plugins: [solid(), svgr(), tsconfigPaths()],
  server: {
    hmr: {
      overlay: false,
    },
  },
  test: {
    setupFiles: ['./setupTests.ts'],
    include: ['**/*.test.ts', '**/*.test.tsx'],
    globals: true,
    environment: 'jsdom',
    transformMode: {
      web: [/.[jt]sx?/],
    },
    deps: {
      inline: [/solid-start/, /solid-testing-library/],
    },
  },
  resolve: {
    conditions: ['development', 'browser'],
  },
});
