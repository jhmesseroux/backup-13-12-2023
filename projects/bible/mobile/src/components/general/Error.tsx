import { View, Text } from 'react-native'
import React from 'react'

const Error = ({ text }: { text: string }) => {
  return (
    <View className='bg-red-50 w-full p-4 mb-3 rounded-md'>
      <Text className='text-red-600 text-left font-semibold'>{text}</Text>
    </View>
  )
}

export default Error