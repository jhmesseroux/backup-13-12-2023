import { View, Text, TouchableOpacity } from 'react-native';
import React, { useContext } from 'react';
import { MaterialIcons, Ionicons } from '@expo/vector-icons';
import { AuthContext } from '../../context/auth/AuthContext';
import { useNavigation } from '@react-navigation/native';
import { brandColor } from '../../helpers/variable';

interface Props {
  arrow?: Boolean;
  titleClass?: string;
  title: string;
  action: any;
  rightText?: string;
  iconName?: any;
  iconColor?: string;
  iconBoxClass?: string;
  border?: boolean;
  protect?: boolean;
}
const OptionLink = ({ action, title, iconName, iconColor = 'white', iconBoxClass = 'bg-brand2', rightText, titleClass = '', arrow = true, border = true, protect = false }: Props) => {
  const { token } = useContext(AuthContext)
  const navigation = useNavigation();

  return (
    <TouchableOpacity
      onPress={() => {
        if (protect) {
          if (token?.length > 0) {
            action();
          } else {
            navigation.navigate('Login' as never);
          }
        } else {
          action();
        }
      }}
      className='flex flex-row justify-start items-center pl-2'
      activeOpacity={0.8}
    >
      <View className={`flex   p-1 shadow-md  w-8 h-8 rounded-full  items-center justify-center ${iconBoxClass}`}>
        <Ionicons name={iconName} size={20} color={iconColor} />
      </View>
      <View className={`flex flex-row justify-between  flex-1 items-center   pb-2 p-2  ${border && ' border-b border-gray-100 '}`}>
        <Text className={`text-base font-medium text-gray-600  ${titleClass}`}>{title}</Text>
        <View className='flex items-center flex-row'>
          {rightText?.length > 0 && <Text className='text-brand2 font-medium  text-md'>{rightText}</Text>}
          {arrow && (
            <Ionicons
              name='chevron-forward-outline'
              size={20}
              color={brandColor}
            />
          )}
        </View>
      </View>
    </TouchableOpacity>
  );
};

export default OptionLink;
