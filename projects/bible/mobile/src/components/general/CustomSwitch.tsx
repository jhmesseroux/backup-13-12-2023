import { View, Text, Switch, StyleSheet } from 'react-native';
import React, { useContext } from 'react';
import useForm from '../../hooks/useForm';
// import { ThemeContext } from '../context/Theme/ThemeContext';

interface Props {
  title?: string;
  isActive: boolean;
  onUpdate: (value: boolean) => void;
  CStyle?: any
}

const CustomSwitch = ({ isActive, title, onUpdate, CStyle }: Props) => {
  const { isEnabled, onChange } = useForm({ isEnabled: isActive });
  return (
    <View style={{ ...styles.switch, ...CStyle }}>
      <Text className='text-lg font-semibold text-gray-600 ml-6 capitalize' >{title ? title : ''}</Text>
      <Switch
        trackColor={{ false: '#767577', true: '#81b0ff' }}
        thumbColor={isEnabled ? '#f5dd4b' : '#f4f3f4'}
        // ios_backgroundColor="#3e3e3e"
        onValueChange={value => {
          onChange(value, 'isEnabled');
          onUpdate(value);
        }}
        value={isEnabled}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  switch: {
    justifyContent: 'space-between',
    alignItems: 'center',
    flexDirection: 'row',
  },
});
export default CustomSwitch;
