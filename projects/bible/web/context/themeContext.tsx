'use client';
import React, { createContext, useState } from 'react';

export interface ThemeState {
  backgroundColor: string;
  textColor: string;
  boxColor: string;
  borderColor: string;
  dark: boolean;
  bgBox: string;
}

export const initialState = {
  user: null,
  chatId: null,
};
export interface ThemeContextProps {
  theme: ThemeState;
  update: (t: ThemeState) => void;
}

export const LightTheme: ThemeState = {
  dark: false,
  backgroundColor: '#f2f2f2',
  textColor: 'black',
  boxColor: '#F2F2F2',
  bgBox: 'white',
  borderColor: 'rgba(0,0,0,0.1)',
};

export const DarkTheme: ThemeState = {
  dark: true,
  backgroundColor: '#06283D',
  bgBox: 'rgb(0 26 42)',
  textColor: 'white',
  boxColor: 'rgb(8 115 185 / 22%)',
  borderColor: 'rgba(255,255,255,0.1)',
};

const defaultTheme = LightTheme;
// const defaultTheme = DarkTheme;

export const ThemeContext = createContext({} as ThemeContextProps);

export const ThemeProvider = ({ children }: any) => {
  const [theme, setTheme] = useState(defaultTheme);

  const update = (t: ThemeState) => setTheme(t);

  return (
    <ThemeContext.Provider
      value={{
        theme,
        update,
      }}
    >
      {children}
    </ThemeContext.Provider>
  );
};
