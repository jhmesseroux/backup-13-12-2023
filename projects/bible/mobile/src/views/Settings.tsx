import { StyleSheet, Text, View, Pressable, Button, Image, ActivityIndicator } from 'react-native';
import React, { useContext, useState, useEffect } from 'react';
import { ThemeContext } from '../context/theme/ThemeContext';
import Login from './auth/Login';
import { useColorScheme } from 'nativewind';
import { useNavigation } from '@react-navigation/native';
import { AuthContext } from '../context/auth/AuthContext';
import OptionBox from '../components/general/OptionBox';
import { Fontisto } from '@expo/vector-icons';
import { ScrollView, TouchableOpacity } from 'react-native-gesture-handler';
import { Ionicons } from '@expo/vector-icons';
import { MaterialIcons } from '@expo/vector-icons';
import OptionLink from '../components/general/OptionLink';
import RadioButton from '../components/general/RadioButton';
import CustomSwitch from '../components/general/CustomSwitch';
import { StatusBar } from 'expo-status-bar';
import { appStyle } from '../theme/appStyle';
import { PrimaryColor, brandColor } from '../helpers/variable';
import DefaultAvatar from '../components/users/DefaultAvatar';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as ImagePicker from 'expo-image-picker';
import { http, httpSecure } from '../api/api';
import { IUpdatePhotoUser } from '../interfaces/users/IUpdatePhoto';
import ShowAlert from '../components/general/ShowAlert';

const Settings = ({ navigation }) => {
  const { logOut, user, token, updateUserData, showAlert, updateAlertMessage, alertMessage, alertColor, updateAlertColor, toggleFlashAlerts } = useContext(AuthContext)
  const { colorScheme, toggleColorScheme } = useColorScheme();
  const [option, setOption] = useState(null);
  const [uploadingPhoto, setUploadingPhoto] = useState(false)
  const [previewImage, setPreviewImage] = useState('')

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Plus',
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: brandColor,
      },
      headerRight: (props) => (
        !!token && (
          <Pressable className='text-white mr-3 ' onPress={() => navigation.navigate('EditProfile' as never)}>
            <Text className='text-base text-white font-semibold'>Edit Profil</Text>
          </Pressable>
        )
      ),
    })
  }, [token])

  const pickImageAsync = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      allowsEditing: true,
      base64: true,
      aspect: [1, 1],
      quality: 1,

    });
    // console.log(result)
    if (!result.cancelled) {
      setUploadingPhoto(true)
      try {
        // @ts-expect-error
        const res = await http.patch<IUpdatePhotoUser>('/users/updatePhoto', { photo: 'data:image/jpg;base64,' + result.base64 }, { headers: { Authorization: 'Bearer ' + token } })
        if (res.data.ok) {
          updateUserData(user.username, user.email, res.data.data.photo)
          updateAlertMessage('Photo mise à jour avec succès.')
          toggleFlashAlerts(true)
        } else {
          updateAlertColor('bg-red-500')
          updateAlertMessage('Erreur lors de la mise à jour de la photo.')
          toggleFlashAlerts(true)
        }
      } catch (error) {
        toggleFlashAlerts(true)
        console.log(error.response.data)
        updateAlertColor('bg-red-500')
        updateAlertMessage(error.response.data.message || 'Erreur lors de la mise à jour de la photo.')
      } finally { setUploadingPhoto(false) }

    } else {
      toggleFlashAlerts(true)
      updateAlertMessage('Erreur lors de la mise à jour de la photo.')
    }
  };

  const clearAll = async () => {
    try {
      await AsyncStorage.clear()
    } catch (e) {
      // clear error
    }
  }

  return (
    <>
      <ScrollView >
        <StatusBar style={colorScheme} />
        <View className='items-center justify-center my-4'>
          {
            user?.photo ?
              <Image
                className='rounded-full overflow-hidden shadow-md border border-brand border-dashed object-cover bg-white '
                style={{ width: 100, height: 100, borderWidth: .5, borderColor: brandColor, }}
                source={{ uri: user.photo }}
              />
              : (<DefaultAvatar className='!w-20 !h-20 ' />)
          }
          <Text className='text-slate-700 text-lg font-semibold'>{user?.username}</Text>
          <Text className='text-brand2 text-xs'>{user?.email}</Text>
        </View>

        {
          !!token ? (
            <OptionBox>
              {
                uploadingPhoto ? (
                  <ActivityIndicator size='small' color={brandColor} />
                ) : (
                  <OptionLink
                    title='Changer photo de Profil'
                    border={false}
                    iconBoxClass=''
                    iconColor='#0081C9'
                    iconName='camera-outline'
                    arrow={false}
                    titleClass='text-blue-600'
                    action={() => pickImageAsync()} />
                )
              }
            </OptionBox>
          )
            : (
              <OptionBox>
                <OptionLink iconColor='blue' border={false} iconName='person-outline' iconBoxClass='white' title="S'identifier ou S'inscrire" titleClass='text-blue-700' action={() => navigation.navigate('Login')} />
              </OptionBox>
            )
        }

        <OptionBox title=''>
          <OptionLink title="Verset du jour" iconBoxClass='bg-slate-800' iconName='sunny-outline' protect action={() => { navigation.navigate('VersesOfThedays' as never) }} />
          <OptionLink border={false} iconName='ios-videocam-outline' iconBoxClass='bg-red-500' title="Videos" protect action={() => navigation.navigate('HighlightedVerses')} />
        </OptionBox>

        {/* Mes Favorites */}
        <OptionBox title=''>
          <OptionLink title="Chansons préférées" iconName='ios-heart-outline' protect action={() => { navigation.navigate('FavouriteSongs' as never) }} />
          <OptionLink iconName='brush-outline' iconBoxClass='bg-brand' title="Surbrillances" protect action={() => navigation.navigate('HighlightedVerses')} />
          <OptionLink iconName='bookmark-outline' iconBoxClass='bg-blue-500' title="Favoris" protect action={() => navigation.navigate('FavouriteVerses')} />
          <OptionLink border={false} iconName='book-outline' iconBoxClass='bg-fuchsia-600' title="Notes" protect action={() => navigation.navigate('NotesVerses')} />
          {/* <OptionLink border={false} iconName='ios-image-outline' iconBoxClass='bg-cyan-600' title="Images" protect action={() => navigation.navigate('ImagesVerses')} /> */}
          {/* <OptionLink border={false} iconColor='gray' iconName='chatbox-ellipses-outline' title="Mes Notes" protect action={() => navigation.navigate('Login' as never)} /> */}
        </OptionBox>



        {/* // TODO :: leave for next version   */}
        {/* <OptionBox title='Apparence'>
        <View className='flex flex-row justify-between items-center ml-1 '>
          <View className={`flex   p-1 shadow-md rounded-md  items-center justify-center `}>
            <Ionicons name={colorScheme === 'dark' ? 'moon-outline' : 'sunny-outline'} size={25} color="blue" />
          </View>
          <CustomSwitch CStyle={{ flex: 1 }} isActive={colorScheme === 'dark'} title='Sombre/Clair' onUpdate={(v) => toggleColorScheme()} />
        </View>
      </OptionBox> */}

        {/* // TODO :  For next Version  */}
        {/* <OptionBox>
        <OptionLink title="Partager A TES PIEDS JESUS" iconColor='gray' iconBoxClass='white' iconName='share-outline' action={() => navigation.navigate('FavouriteSongs' as never)} />
        <OptionLink iconColor='gray' iconName='information-circle-outline' iconBoxClass='white' title="A propos" action={() => navigation.navigate('FavouriteVerses' as never)} />
        <OptionLink iconColor='gray' border={false} iconBoxClass='white' iconName='heart-outline' title="Don" action={() => console.log('text text')} />
      </OptionBox> */}

        {
          !!token && (
            <OptionBox>
              <OptionLink iconColor='#EB455F' border={false} iconName='log-in-outline' iconBoxClass='white' title='Se déconnecter' arrow={false} titleClass='text-red-700' action={() => logOut()} />
            </OptionBox>
          )
        }
        <View className='mx-3 mb-4 text-center flex items-center justify-center' >
          <Image style={{ width: 150, height: 150, opacity: .9 }} source={require('../assets/logoApp.png')} />
          <Text className='text-center text-brand2 text-lg font-bold '>A Tes Pieds Jesus V1.0</Text>
          {/* add image heree ...  */}
        </View>
        <Button title='clear localstorage' onPress={clearAll} />
      </ScrollView>
      {showAlert && (<ShowAlert text={alertMessage} color={alertColor} />)}
    </>
  );
};

export default Settings;