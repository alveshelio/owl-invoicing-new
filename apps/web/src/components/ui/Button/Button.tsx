import { JSX, ParentComponent } from 'solid-js';

export const Button: ParentComponent<JSX.ButtonHTMLAttributes<HTMLButtonElement>> = (props) => {
  const { children, ...buttonProps } = props;
  return (
    <button class="" {...buttonProps}>
      {children}
    </button>
  );
};
