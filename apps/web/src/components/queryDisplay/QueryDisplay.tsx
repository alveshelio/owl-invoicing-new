import { CreateQueryResult } from '@tanstack/solid-query';
import { Match, Switch, JSX } from 'solid-js';

type QueryDisplayProps<Query> = {
  query: Query;
  hasData: boolean;
  children: JSX.Element;
};

export const QueryDisplay = <Query extends CreateQueryResult>(props: QueryDisplayProps<Query>) => {
  return (
    <Switch>
      <Match when={props.query.isLoading} keyed={false}>
        <p>Loading</p>
        <pre>{JSON.stringify(props.query, null, 2)}</pre>
      </Match>
      <Match when={props.query.isError} keyed={false}>
        <p>There was an error</p>
      </Match>
      <Match when={props.query.isSuccess && !props.hasData} keyed={false}>
        <p>There's no data</p>
      </Match>
      <Match when={props.query.isSuccess} keyed={false}>
        {props.children}
      </Match>
    </Switch>
  );
};
