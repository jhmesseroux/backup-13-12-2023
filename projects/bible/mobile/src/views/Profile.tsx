import { ScrollView, Text, TouchableOpacity, View } from 'react-native'
import React, { useContext, useEffect, useState } from 'react'
import { AuthContext } from '../context/auth/AuthContext';
import { StatusBar } from 'expo-status-bar';
import { PrimaryColor } from '../helpers/variable';
import Icon from '../components/icons/Icon';
import CustomInput from '../components/CustomInput';
import useForm from '../hooks/useForm';
import { http } from '../api/api';
import ShowAlert from '../components/general/ShowAlert';
import { validateForm } from '../helpers/form';

const Profile = ({ navigation }) => {

  const { token, user, updateUserData, showAlert, toggleFlashAlerts, updateAlertMessage } = useContext(AuthContext);
  const [loading, setLoading] = useState(false)
  const [errors, setErrors] = useState<any>({})
  const { email, username, data, onChange } = useForm({
    email: user?.email,
    username: user?.username,
  });
  const [dataHasChanged, setDataHasChanged] = useState<boolean>(false);
  const [errorUpdatingData, setErrorUpdatingData] = useState(false)

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Modifier votre profil',
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: PrimaryColor,
      },
      headerLeft: (props) => (
        <Icon
          name='chevron-back-outline'
          color='white'
          {...props}
          onPress={() => navigation.goBack()}
        />
      ),
    });
    return () => { };
  }, []);

  useEffect(() => {
    setDataHasChanged(user?.email !== email || username !== user.username)
    return () => { }
  }, [email, username])


  const handleUpdateUserData = async () => {
    setErrorUpdatingData(false)
    const { error, ok } = validateForm(data);
    setErrors(error);
    if (!ok) return false;
    try {
      setLoading(true)
      const { data } = await http.patch('users/updateMe', { username, email }, {
        headers: {
          Authorization: 'Bearer ' + token
        }
      })

      if (data.ok) {
        updateUserData(username, email, user.photo)
        navigation.navigate('More')
        updateAlertMessage('Vos informations ont été mises à jour avec succès')
        toggleFlashAlerts(true)
      }
    } catch (error) {
      if (error.response) { setErrorUpdatingData(error.response.data.message || 'Une erreur est survenue.Essayer à nouveau') }
    } finally { setLoading(false) }
  }
  return (
    <>
      <ScrollView className='flex-1'>
        <StatusBar style='light' />
        <View className='mx-3 mt-4'>
          <CustomInput
            onChange={onChange}
            kbType='email-address'
            initialValue={username}
            label='Nom Complet'
            error={errors?.username ? "Le nom d'utilisateur est obligatoire" : ''}
            name='username'
            placeholder='example@gmail.com'
          />

          <CustomInput
            onChange={onChange}
            kbType='email-address'
            initialValue={email}
            error={errors?.email ? "Le mail est obligatoire et doit être valide" : ''}
            label='Email'
            name='email'
            placeholder='example@gmail.com'
          />

          {errorUpdatingData && <Text className='text-red-500 text-center'>{errorUpdatingData}</Text>}
          <View className='w-fit  shadow-md  my-4'>
            <TouchableOpacity activeOpacity={.8} disabled={!dataHasChanged} className={`${dataHasChanged ? 'bg-blue-600 shadow-indigo-300' : 'bg-gray-400'}  rounded-md`} onPress={handleUpdateUserData}>
              <Text className='text-center font-bold text-lg p-2  text-white'>{loading ? 'En train de sauver...' : 'Sauver'}</Text>
            </TouchableOpacity>
          </View>
        </View>

      </ScrollView>
      {/* {showAlert && (<ShowAlert text={'Vos informations sont mises à jour avec succès'} color='bg-green-600' />)} */}
    </>

  )
}
export default Profile
