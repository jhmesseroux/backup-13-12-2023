import React, { useContext, useEffect } from 'react';
import { useNavigation } from '@react-navigation/core';

import { Button, StyleSheet, Text, View, MaskedViewIOS, Image, Pressable } from 'react-native';
import { AuthContext } from '../context/auth/AuthContext';
import LoggedUserNavBarTop from './users/LoggedUserNavBarTop';
import { ScrollView } from 'react-native-gesture-handler';
import { StatusBar } from 'expo-status-bar';
import OptionBox from '../components/general/OptionBox';
import { LinearGradient, } from 'expo-linear-gradient';
import { Ionicons } from '@expo/vector-icons';
import GiveUs from '../components/users/GiveUs';
import DefaultAvatar from '../components/users/DefaultAvatar';
import { useVerseOfTheDay } from '../hooks/useVerseOfTheDay';
import { BibleContext } from '../context/bible/bibleContext';
import { StackScreenProps } from '@react-navigation/stack';
import { brandColor, brandColor2 } from '../helpers/variable';
import { RefreshControl } from 'react-native';
import { IText } from '../interfaces/bibles/FavouritesVerses';
import { cleanHTML } from '../helpers/text';
import { formatNumeration } from '../helpers/general';
interface Props extends StackScreenProps<any, 'Home'> { }

const Home = ({ navigation }: Props) => {

  const { lecture, updateBook, updateChapter, update } = useContext(BibleContext);
  const { token, user } = useContext(AuthContext);

  console.log('LECTURE OUTTT EFFECT :: ', lecture) //TODO:: load with null sometimes 

  const { data, error, isLoading, isFetching, refetch } = useVerseOfTheDay();
  const handleReadCerseOfTheDay = () => {
    updateBook({
      book_number: data?.data?.data?.bookNumber,
      long_name: data?.data?.data?.bookName,
      chapters: null,
      short_name: null,
      verses: null
    })
    updateChapter(data?.data?.data?.chapter)
    navigation.navigate('Bible', { bookNumber: data?.data?.data?.bookNumber, chapter: data?.data?.data?.chapter })
  }
  useEffect(() => {
    // JSON.parse(await AsyncStorage.getItem('lastBook'))
    console.log('LECTURE INSIDE EFFECT :: ', lecture) //TODO:: load with null sometimes 
    update()
    return () => {
    }
  }, [])

  // if (error) {
  //   console.log('ERROR ::: ', error.response.data)
  // }


  // return <Text>hello</Text>
  return (

    <View className='flex-1 items-center bg-gray-200 '>
      <StatusBar style='light' />
      <View style={{ paddingTop: 45 }} className='w-full px-3 pb-2 flex-row bg-[#8b55f5] flex items-center justify-between'>
        {
          !!token ? (
            <Pressable onPress={() => navigation.navigate('EditProfile' as never)}>

              <View className='flex flex-row gap-1 items-center justify-center'>
                {user?.photo ? <Image className='rounded-full overflow-hidden shadow-lg object-cover' style={{ width: 50, height: 50 }} source={{ uri: user.photo }} /> : (<DefaultAvatar />)}
                <View className='flex flex-row items-center justify-center'>
                  <Text className='font-medium  text-white'>{user?.username?.split(' ')[0]}</Text>
                  <Ionicons
                    name='chevron-forward-outline'
                    size={19}
                    color='white'
                    style={{ marginTop: 3 }}
                    className='mt-1 !pl-3'
                  />
                </View>
              </View>
            </Pressable>
          ) : (
            <View><Pressable onPress={() => navigation.navigate('Login' as never)}>
              <Text className='text-white text-lg font-bold'>S'inscrire</Text>
            </Pressable>
            </View>
          )
        }
        {/* <GiveUs /> */}
      </View>

      <ScrollView className='w-full'
        refreshControl={
          <RefreshControl
            refreshing={isFetching}
            onRefresh={refetch}
          />
        }
      >
        <View className='bg-gray-200 mb-8'>
          {/* verse of the day */}
          <LinearGradient colors={['#8b55f5', 'transparent']} className='w-full  p-3 m-0'>
            <View className='w-full '>
              <View className='p-4 bg-white rounded-lg shadow-lg'>
                <Text className='text-slate-700 font-medium mb-2 text-justify'>
                  {data?.data?.data?.texts?.map((text: IText) => (<Text key={text.verse}>{text.verse + '.' + cleanHTML(text.text)} </Text>))}
                </Text>
                <View className='flex flex-row justify-between items-center'>
                  <Text className='text-gray-500 text-base '>{data?.data?.data?.bookName} {data?.data?.data?.chapter}:{formatNumeration(data?.data?.data?.verses || [])}</Text>
                  <Pressable onPress={() => handleReadCerseOfTheDay()} className='border py-[2px] px-1 border-gray-200 dark:border-slate-600 rounded-full shadow '                >
                    <Text className='text-brand2  p-1 text-base font-normal'>Lire le chapitre</Text>
                  </Pressable>
                </View>
              </View>
            </View>
          </LinearGradient>
        </View>
        <View className='bg-gray-200 flex-1'>
          <View className="mx-3">
            {/* last lecture  */}
            {
              (lecture?.book && lecture?.chapter) && (
                <LinearGradient
                  colors={[brandColor, brandColor2]}
                  // put the gradient left to right 
                  start={{ x: 0, y: 0 }}
                  end={{ x: 1, y: 0 }}
                  className='w-full shadow-lg rounded-md   m-0'>

                  <Pressable
                    // @ts-expect-error
                    onPress={() => navigation.navigate('Bible' as never, { bookNumber: lecture?.book?.book_number, chapter: lecture?.chapter } as never)}
                    className="p-2">
                    <View className="flex justify-between flex-row items-center py-2">
                      <View className="flex flex-row justify-center items-center gap-x-1">
                        <Ionicons
                          name='reader-outline'
                          size={19}
                          color='white'
                        />
                        <View className="flex flex-row items-center ">
                          <Text className="font-medium text-white " >Reprendre votre lecture : </Text>
                          <Text className='text-white '>{lecture?.book?.long_name} {lecture?.chapter}</Text>
                        </View>
                      </View>
                      <Ionicons
                        name='chevron-forward-outline'
                        size={19}
                        color='white'
                      />
                    </View>
                    {/* <Text className='text-blue-600 '>{JSON.stringify(lecture.lastLecture)}</Text> */}
                    {/* <Text className='text-blue-600 '>{JSON.stringify(lecture.book)}</Text> */}
                    {/* <Text className='opacity-80 text-xs text-gray-500'>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur nihil magnam repellat hic sint, illo quas facilis ratione modi? Nisi!</Text> */}
                  </Pressable>
                </LinearGradient>

              )
            }
            {/* list of activities [read bible, sing a song, contact,help for prayer, Question ] */}
            <View>
            </View>

          </View>
        </View>

      </ScrollView>
    </View>
  );
};

export default Home;

