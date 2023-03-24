import { ComboboxDataBase } from '@/components/ui/combobox/combobox.models';
import * as combobox from '@zag-js/combobox';
import { normalizeProps, useMachine } from '@zag-js/solid';
import { createMemo, createSignal, createUniqueId } from 'solid-js';

export const comboboxApi = <T extends ComboboxDataBase>(comboboxData: T[], name: string) => {
  const [options, setOptions] = createSignal<T[]>(comboboxData);

  const [state, send] = useMachine(
    combobox.machine({
      name,
      id: createUniqueId(),
      onOpen() {
        setOptions(comboboxData);
      },
      onInputChange({ value }) {
        const filtered = comboboxData.filter((item) => item.label.toLowerCase().includes(value.toLowerCase()));
        setOptions(filtered.length > 0 ? filtered : comboboxData);
      },
    })
  );

  const api = createMemo(() => combobox.connect(state, send, normalizeProps));

  return { options, api };
};
