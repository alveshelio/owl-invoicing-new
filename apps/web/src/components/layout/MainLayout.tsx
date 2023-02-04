import { ParentComponent } from 'solid-js';

export const MainLayout: ParentComponent = (props) => {
  return <div class="container grid justify-center items-center bg-slate-200 h-screen mx-auto ">{props.children}</div>;
};
