import { Theme } from '@react-navigation/native';

export interface ThemeState extends Theme {
  secondary: string;
}

type ThemeAction = { type: 'setDark' } | { type: 'setLight' };
export const Light: ThemeState = {
  dark: false,
  colors: {
    primary: 'red',
    background: '#F3F3F3',
    card: 'white',
    text: '#17273D',
    border: 'rgba(0, 0, 0, 0.3)',
    notification: '',
  },
  secondary: 'blue',
};
export const Dark: ThemeState = {
  dark: true,
  colors: {
    background: '#0F1A29',
    card: '#3B495B',
    text: '#D6D6D6',
    border: 'C8C8C8',
    primary: 'string',
    notification: 'string',
  },
  secondary: 'string',
};

export const themeReducer = (theme: ThemeState, action: ThemeAction): ThemeState => {
  switch (action.type) {
    case 'setLight':
      return { ...Light };
    case 'setDark':
      return { ...Dark };
    default:
      return theme;
  }
};
