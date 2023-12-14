import React, { createContext, useEffect, useReducer } from 'react';

import AsyncStorage from '@react-native-async-storage/async-storage';
import { ActivityIndicator, View } from 'react-native'
import { SignInput, SignUpInput } from '../../interfaces/users/ISignIn';
import { authReducer, AuthState } from './authReducer';
import { http } from '../../api/api';
import LoadingLogo from '../../components/LoadingLogo';
import { IUser, RenewTokenResponse } from '../../interfaces/users/renewToken';

type AuthContextProps = {
  errorMessage: string;
  alertMessage: string;
  alertColor: string;
  token: string | null;
  user: IUser | null;
  showAlert: boolean;
  status: 'checking' | 'authenticated' | 'not-authenticated';
  signUp: (registerData: any) => void;
  signIn: (signInData: SignInput) => void;
  updateUserData: (username: string, email: string, photo) => void;
  toggleFlashAlerts: (value: boolean) => void;
  logOut: () => void;
  removeError: () => void;
  updateAlertMessage: (value: string) => void;
  updateAlertColor: (value: string) => void;

};

const authInicialState: AuthState = {
  status: 'checking',
  token: null,
  user: null,
  errorMessage: '',
  alertMessage: '',
  alertColor: '',
  showAlert: false

};

export const AuthContext = createContext({} as AuthContextProps);

export const AuthProvider = ({ children }: any) => {
  const [state, dispatch] = useReducer(authReducer, authInicialState);

  useEffect(() => {
    checkToken();
  }, []);

  const checkToken = async () => {
    const token = await AsyncStorage.getItem('token');

    // No token, no autenticado
    if (!token) return dispatch({ type: 'notAuthenticated' });
    // revalidate token and resignin the user from the back
    try {
      const resp = await http.post<RenewTokenResponse>(
        '/users/renewToken',
        {},
        {
          headers: {
            Authorization: 'Bearer ' + token,
          },
        }
      );
      if (!resp.data.ok) {
        return dispatch({ type: 'notAuthenticated' });
      }
      await AsyncStorage.setItem('token', resp.data.token);

      dispatch({
        type: 'signUp',
        payload: {
          token: resp.data.token,
          user: resp.data.data,
        },
      });
    } catch (error) {
      if (error.response) {
        dispatch({
          type: 'addError',
          payload: error.response.data.message || 'Something wrong happenned ! Try again',
        });
      }
    } finally {
      console.log('checking done !')
    }


  };

  const signIn = async ({ email, password }: SignInput) => {
    try {
      const { data } = await http.post<RenewTokenResponse>('/users/signin', { email, password });
      dispatch({
        type: 'signUp',
        payload: {
          token: data.token,
          user: data.data,
        },
      });

      await AsyncStorage.setItem('token', data.token);
    } catch (error) {
      console.log(error.response.data);
      dispatch({
        type: 'addError',
        payload: error.response.data.message || 'Information incorrecte',
      });
    }
  };

  const signUp = async ({ username, email, password }: SignUpInput) => {
    try {
      const { data } = await http.post<RenewTokenResponse>('/users/signup', { username, password, email });
      dispatch({
        type: 'signUp',
        payload: {
          token: data.token,
          user: data.data,
        },
      });

      await AsyncStorage.setItem('token', data.token);
    } catch (error) {
      dispatch({
        type: 'addError',
        payload: error.response.data.message || 'Revise la información',
      });
    }
  };

  const logOut = async () => {
    await AsyncStorage.removeItem('token');
    dispatch({ type: 'logout' });
  };

  const removeError = () => {
    dispatch({ type: 'removeError' });
  };
  const updateUserData = (username, email, photo) => {
    dispatch({
      type: 'updateUserData', payload: {
        username,
        email,
        photo
      },
    });
  };
  const toggleFlashAlerts = (value: boolean) => {
    dispatch({ type: 'toggleFlashAlert', payload: value })
    setTimeout(() => {
      dispatch({ type: 'toggleFlashAlert', payload: false })
      dispatch({ type: 'updateAlertColor', payload: '' })

    }, 5000)
  }
  const updateAlertMessage = (value: string) => dispatch({ type: 'updateAlertMessage', payload: value })
  const updateAlertColor = (value: string) => dispatch({ type: 'updateAlertColor', payload: value })

  if (state.status === 'checking') return <LoadingLogo />
  return (
    <AuthContext.Provider
      value={{
        ...state,
        signUp,
        signIn,
        logOut,
        removeError,
        updateUserData,
        toggleFlashAlerts,
        updateAlertMessage,
        updateAlertColor
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};
