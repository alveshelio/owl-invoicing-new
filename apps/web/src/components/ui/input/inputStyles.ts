import { cva } from 'class-variance-authority';

export const inputStyles = cva('input', {
  variants: {
    size: {
      xs: ['border-gray-300', 'rounded-md', 'h-8', 'bg-red-500', 'shadow-sm text-xs'],
      sm: ['border-gray-300', 'rounded-lg', 'h-10', 'shadow-md text-sm'],
      md: ['border-gray-300', 'rounded-2xl', 'h-13', 'shadow-md text-base'],
      lg: ['border-gray-300', 'rounded-3xl', 'h-16', 'shadow-md', 'text-2xl', 'px-5', 'py-3'],
    },
    full: {
      true: 'w-full',
    },
  },
  defaultVariants: {
    size: 'md',
  },
});
