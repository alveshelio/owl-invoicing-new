import { getAuthorizer } from '@/contexts/AuthorizerContext';
import { useNavigate } from '@solidjs/router';
import { createEffect } from 'solid-js';
import { createForm } from '@felte/solid';
import { z } from 'zod';

export default function LoginPage() {
  const schema = z.object({
    email: z
      .string()
      .email({ message: 'Please enter a valid email address' })
      .min(1, { message: 'Enter an email address' }),
    password: z.string().min(1, { message: 'Enter a password' }),
  });
  const [state, { authorizer, setAuthData }] = getAuthorizer();
  const navigate = useNavigate();

  const { form } = createForm<z.infer<typeof schema>>({
    onSubmit: async ({ email, password }) => {
      const data = await authorizer.login({ email, password });
      if (data) {
        setAuthData(data);
      }
    },
    onSuccess: () => {
      navigate('/dashboard');
    },
    onError: (error) => {
      console.error('error on error', error);
    },
  });

  const shouldRedirect = () => !!state.user && !state.loading;

  createEffect(() => {
    if (shouldRedirect()) {
      navigate('/dashboard');
    }
  });

  return (
    <div class="flex flex-col gap-y-4 items-center">
      <form use:form class="">
        <h1>Login</h1>
        <div class="">
          <input class="border-4 border-indigo-600/[.55]" type="text" name="email" id="email" />
          <input class="border-4 border-indigo-600/[.55]" type="text" name="password" id="password" />
          <button class="border border-slate-300 hover:border-indigo-300">Login</button>
        </div>
      </form>
      <div class="flex justify-center" />
    </div>
  );
}
