import { Box } from '@/components/ui/box';
import { comboboxApi } from '@/components/ui/combobox/combobox.api';
import { Label } from '@/components/ui/label';
import { For, Show } from 'solid-js';
import omit from 'lodash.omit';
import { FaSolidCaretDown } from 'solid-icons/fa';

const comboboxData = [
  { label: 'Zambia', code: 'ZA', disabled: false },
  { label: 'Benin', code: 'BN', disabled: false },
  //...
];

type ComboboxProps = {
  label: string;
  name?: string;
  placeholder?: string;
};

export const Combobox = (props: ComboboxProps) => {
  const { options, api } = comboboxApi(comboboxData, props.name ?? 'combobox');

  return (
    <div class="relative">
      <div {...api().rootProps}>
        <Label {...api().labelProps}>{props.label}</Label>
        <div
          class="flex gap-1 border border-green-400 border-2 max-w-min rounded-2xl py-1 px-3 text-slate-400"
          {...api().controlProps}
        >
          <input
            placeholder={props.placeholder}
            class="ring-0 ring-transparent border-b-2 border-t-0 border-l-0 border-r-0 border-green-400 py-0.5 px-1"
            {...omit(api().inputProps, 'size')}
          />
          <button class="text-green-400" {...api().triggerProps}>
            <FaSolidCaretDown size={16} />
          </button>
        </div>
      </div>
      <Box
        class="z-10 min-w-min border-2 border-slate-300 rounded-md bg-white text-slate-600"
        elevation="xl"
        {...api().positionerProps}
      >
        <Show when={options().length > 0} keyed={false}>
          <ul {...api().contentProps}>
            <For each={options()}>
              {(item, index) => (
                <li
                  class="first:rounded-t-md last:rounded-b-md hover:bg-green-300 hover:cursor-pointer px-3 py-1 text-slate-500"
                  {...api().getOptionProps({
                    label: item.label,
                    value: item.code,
                    index: index(),
                    disabled: item.disabled,
                  })}
                >
                  {item.label}
                </li>
              )}
            </For>
          </ul>
        </Show>
      </Box>
    </div>
  );
};
