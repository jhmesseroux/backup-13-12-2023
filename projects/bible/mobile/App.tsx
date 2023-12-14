import 'react-native-gesture-handler';
import { NavigationContainer } from '@react-navigation/native';
import { StackNavigation } from './src/navigators/StackNavigation';
// import TabsBottom from './src/navigators/TabsBottomNavigator';
// import { AuthProvider } from './src/context/AuthContext';
import { ThemeProvider } from './src/context/theme/ThemeContext';
import {
  QueryClient,
  QueryClientProvider,
} from '@tanstack/react-query';
import { AuthContext, AuthProvider } from './src/context/auth/AuthContext';
import ShowAlert from './src/components/general/ShowAlert';
import { BibleProvider } from './src/context/bible/bibleContext';
import { useContext } from 'react';
import { View, Text } from 'react-native';
import { BottomSheetModalProvider } from '@gorhom/bottom-sheet';
const queryClient = new QueryClient()

export default function App() {

  return (
    <StartApp>
      <ThemeProvider>
        <QueryClientProvider client={queryClient}>
          <AuthProvider>
            <BibleProvider>
              <StackNavigation />
            </BibleProvider>
          </AuthProvider>
        </QueryClientProvider>
      </ThemeProvider>

    </StartApp>
  );
}

const StartApp = ({ children }: any) => {
  const { showAlert, alertMessage, alertColor } = useContext(AuthContext);

  return (
    <NavigationContainer>
      <BottomSheetModalProvider>
        {/* <View className='h-32 bg-red-300 shadow-sm absolute bottom-0 z-50 w-full p-2'>
        <Text >
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit eos id optio soluta sed quisquam, velit ratione sunt temporibus eaque!
        </Text>
      </View> */}
        {/* {showAlert && <ShowAlert text={alertMessage} color={alertColor} />} */}
        {children}
      </BottomSheetModalProvider>
    </NavigationContainer>
  )
};
