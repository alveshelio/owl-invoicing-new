import { MainLayout } from '@/components/layout/MainLayout';
import { Button } from '@/components/ui';
import { getAuthorizer } from '@/contexts/AuthorizerContext';
import { useNavigate } from '@solidjs/router';
import { createEffect } from 'solid-js';
import { createForm } from '@felte/solid';
import { z } from 'zod';

export default function SignUpPage() {
  const navigate = useNavigate();
  const schema = z.object({
    email: z
      .string()
      .email({ message: 'Please enter a valid email address' })
      .min(1, { message: 'Enter an email address' }),
    password: z.string(),
  });
  const [state, { authorizer }] = getAuthorizer();
  const { form } = createForm<z.infer<typeof schema>>({
    onSubmit: async ({ email, password }) => {
      await authorizer.signup({
        email,
        password,
        confirm_password: password,
        roles: [import.meta.env.VITE_ADMIN_ROLE, import.meta.env.VITE_USER_ROLE],
        redirect_uri: import.meta.env.VITE_HOST,
      });
    },
    onSuccess: () => {
      navigate('/');
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
    <MainLayout>
      <form use:form class="">
        <h1>Register</h1>
        <div class="">
          <input
            aria-label="email"
            placeholder="email"
            class="border-r-3 border-gray-500"
            type="text"
            name="email"
            id="email"
          />
          <input
            aria-label="password"
            placeholder="password"
            class="border-r-3 border-gray-500"
            type="text"
            name="password"
            id="password"
          />
          <Button>Register</Button>
        </div>
      </form>
    </MainLayout>
  );
}
