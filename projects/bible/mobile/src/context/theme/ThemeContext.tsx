import React, { createContext, useEffect, useReducer, useState } from 'react';
import { Appearance, AppState, useColorScheme } from 'react-native';
import { Dark, Light, themeReducer, ThemeState } from './ThemeReducer';

interface ThemeContextState {
  theme: ThemeState;
  setLightTheme: () => void;
  setDarkTheme: () => void;
}

export const ThemeContext = createContext({} as ThemeContextState);

export const ThemeProvider = ({ children }: any) => {
  // const currentTheme = useColorScheme();
  // console.log('hhh', currentTheme);

  // works fine only  on IOS for now
  // useEffect(() => {
  //   if (currentTheme == 'light') {
  //     setLightTheme();
  //   } else {
  //     setDarkTheme();
  //   }
  // }, [currentTheme]);

  useEffect(() => {
    AppState.addEventListener('change', (status) => {
      console.log(status);
      if (status === 'active') {
        if (Appearance.getColorScheme() === 'light') {
          setLightTheme();
          console.log('legtj');
        } else {
          setDarkTheme();
          console.log('dark');
        }
      }
    });
  }, [Appearance.getColorScheme()]);
  // console.log('Apperencia >: ', Appearance.getColorScheme());

  // const [theme, dispatch] = useReducer(themeReducer, currentTheme === 'light' ? Light : Dark);
  const [theme, dispatch] = useReducer(themeReducer, Appearance.getColorScheme() === 'light' ? Light : Dark);
  const setDarkTheme = () => dispatch({ type: 'setDark' });
  const setLightTheme = () => dispatch({ type: 'setLight' });

  return (
    <ThemeContext.Provider
      value={{
        theme,
        setDarkTheme,
        setLightTheme,
      }}
    >
      {children}
    </ThemeContext.Provider>
  );
};
