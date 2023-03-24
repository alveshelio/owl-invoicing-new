import { boxStyles } from '@/components/ui/box/box.styles';
import { VariantProps } from 'class-variance-authority';
import { JSX, mergeProps, splitProps } from 'solid-js';

export type BoxProps = Omit<JSX.HTMLAttributes<HTMLDivElement>, 'style'> & VariantProps<typeof boxStyles>;

export const Box = (props: BoxProps) => {
  const merged = mergeProps({ elevation: 'md' } as const, props);
  const [selectedProps, divProps] = splitProps(merged, ['class', 'elevation']);

  return (
    <div class={`${selectedProps.class} ${boxStyles({ elevation: selectedProps.elevation })}`} {...divProps}>
      {props.children}
    </div>
  );
};
