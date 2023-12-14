import React from 'react'
import { View, Text, Pressable } from 'react-native'
import { ISong } from '../../interfaces/ISongsBook'
import { LinearGradient } from 'expo-linear-gradient'

const Song = ({ song, navigation, color, cateName }: { song: ISong, navigation: any, color: string, cateName: string }) => {
  return (
    <Pressable
      onPress={() => navigation.navigate('Song', { song, cateName })}
    >
      <View
        className=' py-3  flex flex-row gap-3  '>
        <LinearGradient className='w-11 h-11 rounded-full flex items-center  justify-center ' colors={[color, 'transparent']} >
          <View >
            <Text className='text-gray-700 font-bold text-xl'>{song.num}</Text>
          </View>
        </LinearGradient>
        <Text className='text-lg flex-1 border-b border-gray-100'> {song.title}</Text>
      </View>
    </Pressable>
  )
}

export default Song