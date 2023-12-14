import React from 'react'
import { Text, View } from 'react-native';

const ErrorApp = ({ error }: { error: any }) => {
  console.log(error)
  return (
    <View className='my-6 text-center '>
      <Text className='mb-2 text-red-600'>Oops ! Quelque chose de mal s'est produit. Rafraîchir la page s'il vous plait</Text>
      <Text className=' text-red-400 font-bold'>{error?.response?.data?.message}</Text>
    </View>
  )
}

export default ErrorApp