import { lazy, createEffect } from 'solid-js';
import { Routes, Route, useNavigate } from '@solidjs/router';
import { getAuthorizer } from '@/contexts/AuthorizerContext';

const Home = lazy(() => import('@/pages/Home'));
const Dashboard = lazy(() => import('@/pages/dashboard/Dashboard'));
const Invoices = lazy(() => import('@/pages/Invoices'));
const Quotations = lazy(() => import('@/pages/Quotations'));
const Login = lazy(() => import('@/pages/Login'));
const Signup = lazy(() => import('@/pages/SignUp'));
const Organization = lazy(() => import('@/pages/organization/Organization'));
const NewOrganization = lazy(() => import('@/pages/organization/NewOrganization'));
const EditOrganization = lazy(() => import('@/pages/organization/EditOrganization'));

export const RoutesConfig = () => {
  const navigate = useNavigate();
  const [state] = getAuthorizer();

  createEffect(() => {
    if (!state.user && !state.loading) {
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
      <Route path="/organization">
        <Route path="/:id" component={Organization} />
        <Route path="/new" component={NewOrganization} />
        <Route path="/:id/edit" component={EditOrganization} />
      </Route>
    </Routes>
  );
};
