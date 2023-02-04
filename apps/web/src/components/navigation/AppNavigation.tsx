import { Link, useNavigate } from '@solidjs/router';
import { getAuthorizer } from '@/contexts/AuthorizerContext';
import { Show } from 'solid-js';
import { FaSolidFileInvoiceDollar, FaSolidFileInvoice } from 'solid-icons/fa';
import { BiSolidDashboard } from 'solid-icons/bi';
import { Button } from '@/ui';

export const AppNavigation = () => {
  const navigate = useNavigate();
  const [state, { logout }] = getAuthorizer();
  const isLoggedIn = () => state.user && state.token;

  const handleLogout = async () => {
    await logout();
    navigate('/');
  };

  return (
    <nav class="flex flex-col gap-2">
      <ul class="flex flex-col gap-2 text-slate-700 [&>*]:flex justify-center [&>*]:justify-center">
        <li>
          <Link href="/">
            <BiSolidDashboard size={64} />
          </Link>
        </li>
        <li>
          <Link href="/invoices">
            <FaSolidFileInvoiceDollar size={64} />
          </Link>
        </li>
        <li>
          <Link href="/quotations">
            <FaSolidFileInvoice size={64} />{' '}
          </Link>
        </li>
        <Show when={isLoggedIn()} keyed={true}>
          <li>
            <Button
              class="decoration-2 border border-2 py-1 px-2 rounded-md border-slate-300 hover:border-indigo-300"
              onClick={handleLogout}
            >
              Logout
            </Button>
          </li>
        </Show>
      </ul>
    </nav>
  );
};
