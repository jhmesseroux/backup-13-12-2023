import { LinearGradient } from 'expo-linear-gradient';
import React from 'react';
import { View, ActivityIndicator, Image } from 'react-native'
import { brandColor, brandColor2 } from '../helpers/variable';

const LoadingLogo = () => {


  return (
    <LinearGradient
      colors={['#02012f', brandColor]}
      className='w-full flex-1 h-[180px]  p-3 m-0'
    >
      <View className='flex-1 items-center justify-center'>
        <Image source={require('./../assets/logoApp.png')} style={{ width: 300, height: 300 }} />
        {/* <ActivityIndicator animating={true} size='large' color='white' /> */}
        <ActivityIndicator animating={true} size='large' color='white' className='absolute bottom-[32%] right-[42%] ' />
      </View>
    </LinearGradient>
  );
};

export default LoadingLogo;
