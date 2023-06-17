import { getAuthorizer } from '@/contexts/AuthorizerContext';

export function getToken() {
  const [state] = getAuthorizer();

  return state.token?.id_token;
}

export function getUser() {
  const [state] = getAuthorizer();

  return state.user;
}
