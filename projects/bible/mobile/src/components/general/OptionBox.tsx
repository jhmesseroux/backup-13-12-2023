import { View, Text } from 'react-native'
import React from 'react'

const OptionBox = ({ children, title }: { children: any, title?: string }) => {
  return (
    <View className="mx-3  mb-6">
      {title?.length > 0 && (<Text className="font-semibold uppercase pb-[2px] pl-[5px] text-sm text-gray-600">{title}</Text>)}
      <View className="bg-white rounded-md shadow-md border border-gray-200  overflow-hidden  flex px-1 py-2">
        {children}
      </View>
    </View>
  )
}

export default OptionBox