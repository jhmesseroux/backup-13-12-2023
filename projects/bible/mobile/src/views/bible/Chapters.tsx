import { View, Text, Pressable, TouchableOpacity, ScrollView } from 'react-native'
import React, { useContext, useEffect, useState } from 'react'
import { BibleContext } from '../../context/bible/bibleContext';
import { StackScreenProps } from '@react-navigation/stack';
import IconOnly from '../../components/icons/IconOnly';
interface Props extends StackScreenProps<any, 'Chapters'> { }

const Chapters = ({ navigation, route }: Props) => {
  const { lecture, updateChapter, updateBook } = useContext(BibleContext)
  const [chapters, setChapters] = useState<number[]>([])
  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Chapitres',
      headerTitleStyle: {
        color: 'white'
      },
      headerStyle: {
        backgroundColor: '#008ad6',

      },
      headerRightContainerStyle: {
        paddingRight: 15
      },
      headerLeftContainerStyle: {
        paddingLeft: 15
      },
      headerLeft: () => {
        return (
          <Pressable onPress={() => navigation.goBack()} className='rounded-full  py-1 '>
            <View className='flex flex-row items-center justify-center'>
              <IconOnly name='chevron-back-outline' color='white' />
              <Text className='text-base font-bold text-white'>Livres</Text>
            </View>
          </Pressable>
        )
      },
    });
    return () => { };
  }, []);

  useEffect(() => {
    setChapters([])
    for (let i = 1; i <= route.params.selectedBook.chapters; i++) {
      setChapters(prev => ([...prev, i]))
    }
    return () => { }
  }, [])




  return (
    <ScrollView className='flex-1'>

      <View className='flex flex-row flex-wrap mx-3 my-8'>

        {
          chapters.map(item => (
            <TouchableOpacity activeOpacity={0.8}
              className={`bg-white w-16 h-12 flex-auto rounded shadow flex items-center m-1 justify-center border-b border-gray-100 p-2 ${lecture?.chapter === item && 'bg-blue-500 text-white'}`}
              key={item}
              onPress={async () => {
                await updateBook(route.params.selectedBook);
                await updateChapter(item);
                navigation.navigate('Bible', { bookNumber: route.params.selectedBook.book_number, chapter: item })
              }}>
              <Text className={`text-lg font-bold text-slate-700 ${lecture?.chapter === item && 'text-white'}`}>{item}</Text>
            </TouchableOpacity>
          ))
        }
      </View>
    </ScrollView>
  )
}

export default Chapters