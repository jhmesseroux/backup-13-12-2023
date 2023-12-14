import { onAuthStateChanged } from 'firebase/auth';
import { createContext, useEffect, useReducer } from 'react';
import { auth } from '../firebase';
import { authReducer } from '../reducer/authReducer';


export interface AuthState {
  displayName: string;
  uid: string;
  photoURL: string;
  phoneNumber: string;
  checking: Boolean;

}

export const initialState: AuthState = {
  displayName: '',
  uid: '',
  photoURL: '',
  phoneNumber: '',
  checking: true

};
export interface AuthContextProps {
  authState: AuthState;
  signIn: (user: any) => void;
  signOut: () => void;
}


export const AuthContextProvider = createContext({} as AuthContextProps);

export const AuthContext = ({ children }: any) => {

  useEffect(() => {
    const unSub = onAuthStateChanged(auth, (user) => {
      if (!user) {
        // console.log('no logged user');
        // alert('no logged user');
        // return false;
        signOut();
      } else {
        signIn(user);
      }

      // dispatch({ type: 'finishChecking' });
    });

    return () => {
      unSub();
    };
  }, []);

  const [state, dispatch] = useReducer(authReducer, initialState);

  const signIn = (user: any) => {
    dispatch({ type: 'signIn', payload: user })
    dispatch({ type: 'finishChecking' });

  }
  const signOut = () => {
    dispatch({ type: 'signOut', payload: {} })
    dispatch({ type: 'finishChecking' });

  }

  return <AuthContextProvider.Provider value={{
    authState: state,
    signIn,
    signOut
  }}>{children}</AuthContextProvider.Provider>;
};
