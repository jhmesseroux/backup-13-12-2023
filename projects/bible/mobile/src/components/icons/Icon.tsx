import { Pressable } from 'react-native'
import React from 'react'
import { Ionicons } from '@expo/vector-icons';

interface Props {
  name: any;
  color?: string;
  size?: number;
  extraclass?: string;
  onPress?: () => void;
}

const Icon = ({ color = '#008ad6', size = 30, extraclass, name, onPress }: Props) => {
  return (
    <Pressable onPress={onPress} className={extraclass}>
      <Ionicons name={name} size={size} color={color} />
    </Pressable>
  )
}

export default Icon 