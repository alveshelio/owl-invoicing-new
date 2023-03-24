import { JSX, splitProps } from 'solid-js';

type LabelProps = JSX.HTMLAttributes<HTMLLabelElement> & { children: JSX.Element };

export const Label = (props: LabelProps) => {
  const [selectedProps, labelProps] = splitProps(props, ['class', 'children']);
  return (
    <label class={`text-xs uppercase ${selectedProps.class}`} {...labelProps}>
      {selectedProps.children}
    </label>
  );
};
