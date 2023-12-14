import React from 'react';
import { View } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const DefaultAvatar = ({ className = ' w-10 h-10 ', style }: { className?: string, style?: any }) => {
  return (
    <View
      style={style}
      className={` ${className}  bg-white relative  flex items-center  justify-center overflow-hidden border border-gray-300 mx-1  rounded-full  `}
    >
      <Ionicons
        name='person-outline'
        size={30}
        color='#4B56D2'
      />
    </View>
  );
};

export default DefaultAvatar;
