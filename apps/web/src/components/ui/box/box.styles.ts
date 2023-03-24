import { cva } from 'class-variance-authority';

export const boxStyles = cva('div', {
  variants: {
    elevation: {
      sm: ['drop-shadow-sm'],
      base: ['drop-shadow'],
      md: ['drop-shadow-md'],
      lg: ['drop-shadow-md'],
      xl: ['drop-shadow-xl'],
      '2xl': ['drop-shadow-2xl'],
    },
  },
  defaultVariants: {
    elevation: 'md',
  },
});
