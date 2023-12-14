import { createStackNavigator } from '@react-navigation/stack';
import { useContext } from 'react';
import { AuthContext } from '../context/auth/AuthContext';
import Login from '../views/auth/Login';
import Register from '../views/auth/Register';
import Book from '../views/Book';
import Song from '../views/chants/Song';
import Songs from '../views/chants/Songs';
import Profile from '../views/Profile';
import TabsBottom from './TabsBottomNavigator';
import FavouriteSongs from '../views/users/FavouriteSongs';
import Versions from '../views/bible/Versions';
import Books from '../views/bible/Books';
import Chapters from '../views/bible/Chapters';
import Note from '../views/bible/Note';
import HighlightVerses from '../views/users/HighlightVerses';
import NotesVerses from '../views/users/NotesVerses';
import FavouriteVerses from '../views/users/FavouriteVerses';
import NoteDetails from '../views/bible/NoteDetails';
import VersesOfTheDays from '../views/users/VersesOfTheDays';
const Stack = createStackNavigator();

export const StackNavigation = () => {
  const { token } = useContext(AuthContext);

  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
      }}
    >
      <Stack.Screen name='Start' component={TabsBottom} options={{ title: 'Accueil' }} />
      {
        !!token ? (
          <>
            <Stack.Screen name='EditProfile' component={Profile} options={{ presentation: 'modal' }} />
            <Stack.Screen name='FavouriteSongs' component={FavouriteSongs} />
            <Stack.Screen name='HighlightedVerses' component={HighlightVerses} />
            <Stack.Screen name='FavouriteVerses' component={FavouriteVerses} />
            <Stack.Screen name='NotesVerses' component={NotesVerses} />
            <Stack.Screen name='NoteDetails' component={NoteDetails} />
            <Stack.Screen name='VersesOfThedays' component={VersesOfTheDays} />
          </>
        ) : (
          <>
            <Stack.Screen name='Login' component={Login} />
            <Stack.Screen name='LoginBeforeAct' component={Login} options={{ presentation: 'modal' }} />
            <Stack.Screen name='Register' component={Register} />
          </>
        )
      }
      <Stack.Group navigationKey={!!token ? 'loggedUser' : 'guest'}>
        <Stack.Screen name='Songs' component={Songs} />
        <Stack.Screen name='Song' component={Song} />
        <Stack.Screen name='Note' component={Note} />
        <Stack.Screen name='Versions' component={Versions} options={{ presentation: 'modal' }} />
        <Stack.Screen name='Books' component={Books} options={{ presentation: 'modal' }} />
        <Stack.Screen name='Chapters' component={Chapters} options={{ presentation: 'modal' }} />
      </Stack.Group>

    </Stack.Navigator>
  );
};
