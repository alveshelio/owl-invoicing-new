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
  });
  const [state, { authorizer }] = getAuthorizer();
  createForm<z.infer<typeof schema>>({
    onSubmit: async ({ email }) => {
      await authorizer.magicLinkLogin({ email });
    },
    onSuccess: (response) => {
      console.log('response on success', response);
    },
    onError: (error) => {
      console.error('error on error', error);
    },
  });

  const navigate = useNavigate();

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
          <button class="border border-slate-300 hover:border-indigo-300">Send Link</button>
        </div>
      </form>
      <div class="flex justify-center" />
    </div>
  );
}
