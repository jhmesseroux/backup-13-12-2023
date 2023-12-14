import { View, Text } from 'react-native'
import React from 'react'
import Icon from '../icons/Icon'

const GiveUs = ({ color = 'white' }) => {
  return (
    <View className='py-1 px-2 rounded-full border border-gray-200 flex flex-row  justify-center items-center '>
      <View>
        <Text className='text-white text-base font-semibold mr-1'>Donnez</Text>
      </View>
      <Icon name="heart" color={color} size={20} />
    </View>
  )
}

export default GiveUs