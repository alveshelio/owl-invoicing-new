import { defineConfig } from 'vite';
import solidPlugin from 'vite-plugin-solid';
import svgr from 'vite-plugin-svgr';
import tsconfigPaths from 'vite-tsconfig-paths';

export default defineConfig({
  plugins: [solidPlugin(), svgr(), tsconfigPaths()],
  server: {
    port: 3000,
  },
  build: {
    target: 'esnext',
  },
});
