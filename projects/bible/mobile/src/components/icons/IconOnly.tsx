import React from 'react'
import { Ionicons } from '@expo/vector-icons';

interface Props {
  name: any;
  color?: string;
  size?: number;
  className?: string;
}

const IconOnly = ({ color = '#008ad6', size = 30, className = '', name }: Props) => {
  return (<Ionicons name={name} size={size} color={color} />)
}

export default IconOnly 