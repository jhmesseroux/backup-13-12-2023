import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { useContext } from 'react';
import { FontAwesome5 } from '@expo/vector-icons';
import { Ionicons } from '@expo/vector-icons';
import { AntDesign, MaterialCommunityIcons } from '@expo/vector-icons';
// import { MaterialCommunityIcons } from '@expo/vector-icons';

import Bible from '../views/bible/Bible';
import Settings from '../views/Settings';
import { ThemeContext } from '../context/theme/ThemeContext';
import Chants from '../views/chants/Chants';
import Home from '../views/Home';
import Videos from '../views/Videos';
import { PrimaryColor, brandColor } from '../helpers/variable';
import { AuthContext } from '../context/auth/AuthContext';

const Tab = createBottomTabNavigator();

const TabsBottom = () => {
  const { token } = useContext(AuthContext);

  return (
    <Tab.Navigator
      initialRouteName='Home'
      screenOptions={{
        headerShown: false,
        tabBarStyle: {
          backgroundColor: '#eaeaea',
          // backgroundColor: 'blue',
          borderTopWidth: 0,
          elevation: 0,
          zIndex: 0,
        },
        // tabBarActiveBackgroundColor: '#007cd1',
        tabBarActiveTintColor: '#8b55f5',

        tabBarItemStyle: {
          // backgroundColor: 'white',
          // padding: 0,
          // borderRadius: 9999,
          marginRight: 5,
          marginLeft: 4

        },
      }}
      sceneContainerStyle={{
        backgroundColor: '#eaeaea',
      }}
    >
      <Tab.Screen
        name='Home'
        component={Home}
        options={{
          tabBarLabel: 'Accueil',
          tabBarIcon: ({ color, size }) => (
            <AntDesign
              name='home'
              size={size}
              color={color}
            />
          ),

        }}
      />
      <Tab.Screen
        name='Chants'
        component={Chants}
        options={{
          tabBarLabel: 'Chants',
          tabBarIcon: ({ color, size }) => (
            <MaterialCommunityIcons
              name="guitar-electric"
              size={size}
              color={color}
            />
          ),
        }}
      />
      <Tab.Screen
        name='Bible'
        component={Bible}

        options={{
          tabBarLabel: 'Bible',
          tabBarIcon: ({ color, size }) => (
            <FontAwesome5
              name='bible'
              size={size}
              color={brandColor}
            />
          ),
        }}

      />
      <Tab.Screen
        name='Videos'
        component={Videos}
        options={{
          tabBarLabel: 'Videos',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name='videocam-outline'
              size={size}
              color={color}
            />
          ),
        }}
      />
      <Tab.Screen
        name='More'
        component={Settings}
        navigationKey={!!token ? 'loggedUser' : 'guest'}
        options={{
          tabBarLabel: 'Plus',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name='menu-outline'
              size={size}
              color={color}
            />
          ),
        }}
      />
    </Tab.Navigator>
  );
};

export default TabsBottom;
