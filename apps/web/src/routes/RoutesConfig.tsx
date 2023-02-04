import { lazy, createEffect } from 'solid-js';
import { Routes, Route, useNavigate } from '@solidjs/router';
import { getAuthorizer } from '@/contexts/AuthorizerContext';

const Home = lazy(() => import('@/pages/Home'));
const Dashboard = lazy(() => import('@/pages/Dashboard'));
const Invoices = lazy(() => import('@/pages/Invoices'));
const Quotations = lazy(() => import('@/pages/Quotations'));
const Login = lazy(() => import('@/pages/Login'));
const Signup = lazy(() => import('@/pages/SignUp'));

export const RoutesConfig = () => {
  const navigate = useNavigate();
  const [state] = getAuthorizer();
  const isLoggedIn = () => !!state.user && !!state.token;
  const isLoading = () => !state.loading;

  console.warn('isLoggedIn', isLoggedIn());
  console.warn('isLoading', isLoading());
  createEffect(() => {
    if (!state.user && !!state.token && !state.loading) {
      console.warn('is not loggedIn', !isLoggedIn());
      console.warn('is going to redirect to /');
      navigate('/');
    }
  });

  return (
    <Routes>
      <Route path="/" component={Home} />
      <Route path="/login" component={Login} />
      <Route path="/signup" component={Signup} />
      <Route path="/dashboard" component={Dashboard} />
      <Route path="/invoices" component={Invoices} />
      <Route path="/quotations" component={Quotations} />
    </Routes>
  );
};
