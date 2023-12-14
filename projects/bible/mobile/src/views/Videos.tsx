import { View, Text, Image, Pressable, FlatList } from 'react-native'
import React, { useEffect } from 'react'
import { brandColor } from '../helpers/variable';
import { StackScreenProps } from '@react-navigation/stack';
import * as Linking from 'expo-linking';
import ShowAlert from '../components/general/ShowAlert';

interface Props extends StackScreenProps<any, 'Chants'> { }

const Videos = ({ navigation }: Props) => {
  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Videos',
      headerTitleAlign: 'center',
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: brandColor,
      }
    });
    return () => { };
  }, []);

  return (
    <View className='mt-6'>
      {/* add a card to show the youtube channel and a text to notice the coming soon the rest  */}

      <FlatList
        data={[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
        renderItem={({ item }) => (
          <Pressable onPress={() => Linking.openURL('https://www.hilairemesseroux.com')} >
            <View className='bg-violet-600 w-[350px] h-[200px] overflow-hidden shadow rounded-md ml-2 mr-4'>
              <Image style={{}} className='object-contain w-full h-full' source={require('../assets/logoApp.png')} />
            </View>
            <View className='text-xs font-semibold truncate    p-[4px] overflow-hidden w-[350px]'>
              <Text>
                Chanel YOUTUBE A Tes Pieds Jésus fdsf df df dfsdf fsdf jesususususu ff
                Chanel YOUTUBE A Tes Pieds Jésus fdsf df df dfsdf fsdf jesususususu ff
              </Text>
            </View>
          </Pressable>
        )}
        horizontal
      // className='w-full'

      />
    </View>
  )
}

export default Videos