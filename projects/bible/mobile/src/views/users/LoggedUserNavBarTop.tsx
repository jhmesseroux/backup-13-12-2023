import { View, Text, Image } from 'react-native'
import React from 'react'
import DefaultAvatar from '../../components/users/DefaultAvatar'
import { Ionicons } from '@expo/vector-icons';
import { IUser } from '../../interfaces/users/renewToken';
import GiveUs from '../../components/users/GiveUs';
// import { LinearGradient } from 'expo-linear-gradient';

const LoggedUserNavBarTop = ({ user }: { user: IUser }) => {
  return (
    <View style={{ paddingTop: 50 }} className='w-full px-3 pb-2 flex-row bg-[#3C79F5] flex items-center justify-between'>
      <View className='flex flex-row gap-1 items-center justify-center'>
        {user?.photo ? <Image style={{ width: 50, height: 50 }} source={{ uri: user.photo }} /> : (<DefaultAvatar />)}
        <View className='flex flex-row items-center justify-center'>
          <Text className='font-medium  text-white'>{user?.username?.split(' ')[0]}</Text>
          <Ionicons
            name='chevron-forward-outline'
            size={19}
            color='white'
            style={{ marginTop: 3 }}
            className='mt-1 !pl-3'
          />
        </View>
      </View>
      <GiveUs />
    </View>

  )
}

export default LoggedUserNavBarTop