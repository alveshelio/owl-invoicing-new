import { MainLayout } from '@/components/layout/MainLayout';
import { Button } from '@/ui';
import { Link, useNavigate } from '@solidjs/router';
import { getAuthorizer } from '@/contexts/AuthorizerContext';
import { createEffect } from 'solid-js';

export default function HomePage() {
  const [state] = getAuthorizer();
  const navigate = useNavigate();

  createEffect(() => {
    if (state.user && !state.loading) {
      navigate('/dashboard');
    }
  });

  return (
    <MainLayout>
      <div class="border rounded-md border-gray-200 py-3 px-3 flex flex-col gap-y-4 items-center justify-center bg-slate-100 shadow-lg">
        <h1 class="text-2xl text-gray-900">Welcome to Owl Invoicing</h1>
        <Link href="/login">
          <Button class="border border-2 border-slate-500 rounded-md py-1 px-2 bg-slate-100 text-slate-700">
            Login
          </Button>
        </Link>
        <Link href="/signup">
          <Button class="border border-2 border-slate-500 rounded-md py-1 px-2 bg-slate-100 text-slate-700">
            Sign Up
          </Button>
        </Link>
      </div>
    </MainLayout>
  );
}
