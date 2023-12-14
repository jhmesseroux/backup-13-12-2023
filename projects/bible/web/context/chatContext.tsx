import React, { createContext, useReducer } from 'react';
import { chatReducer } from '../reducer/chatReducer';


export interface AuthState {
  displayName: string;
  uid: string;
  photoURL: string;
  phoneNumber: string;
  checking: Boolean;

}

export const initialState = {
  user: null,
  chatId: null,

};
export interface ChatContextProps {
  user: AuthState;
  chatId: string;
  updateChatId: (user: any, chatId: string) => void;
  clearCurrentChat: () => void;
}

export const ChatProvider = createContext({} as ChatContextProps);

export const ChatContext = ({ children }: any) => {
  const [state, dispatch] = useReducer(chatReducer, initialState);

  const updateChatId = (user: AuthState, chatId: string) => {
    dispatch({ type: 'updateChatId', payload: { user, chatId } })
  }
  const clearCurrentChat = () => {
    dispatch({ type: 'clearCurentChat' })
  }


  return <ChatProvider.Provider value={{
    ...state,
    updateChatId,
    clearCurrentChat
  }}>
    {children}
  </ChatProvider.Provider>;
};
