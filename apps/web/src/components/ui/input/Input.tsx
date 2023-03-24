import { JSX, mergeProps, splitProps } from 'solid-js';
import { VariantProps } from 'class-variance-authority';
import { inputStyles } from 'src/components/ui/input/input.styles';

export type InputProps = Omit<JSX.InputHTMLAttributes<HTMLInputElement>, 'size'> & VariantProps<typeof inputStyles>;

type Size = VariantProps<typeof inputStyles>['size'];

export const Input = (props: InputProps) => {
  const merged = mergeProps({ type: 'text', size: 'md' }, props);
  const [selectedProps, inputProps] = splitProps(merged, ['class', 'size']);

  const inputWrapperHeight = (size: Size) => {
    switch (size) {
      case 'xs':
        return 'h-14';
      case 'sm':
        return 'h-16';
      case 'md':
        return 'h-20';
      case 'lg':
        return 'h-15';
    }
  };

  return (
    <div class={`flex flex-col justify-end relative ${inputWrapperHeight(selectedProps.size as Size)}`}>
      <input
        class={`peer ${inputStyles({ size: selectedProps.size as Size })} ${selectedProps.class}`}
        {...inputProps}
      />
      <label class="absolute left-0 top-0 text-gray-400" for={props.id}>
        {props.placeholder}
      </label>
    </div>
  );
};
