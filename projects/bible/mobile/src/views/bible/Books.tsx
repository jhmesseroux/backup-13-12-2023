import { View, Text, Pressable, FlatList, TouchableOpacity } from 'react-native'
import React, { useContext, useEffect } from 'react'
import ErrorApp from '../../components/ErrorApp';
import Loading from '../../components/Loading';
import { BibleContext } from '../../context/bible/bibleContext';
import { StackScreenProps } from '@react-navigation/stack';
import useBooks from '../../hooks/useBooks';
import { brandColor } from '../../helpers/variable';
import IconOnly from '../../components/icons/IconOnly';
import BookChapters from '../../components/BookChapters';
interface Props extends StackScreenProps<any, 'Books'> { }

const Books = ({ navigation }: Props) => {
  const { lecture } = useContext(BibleContext)
  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      headerTitle: 'Livres',
      headerTitleStyle: {
        // display: 'none'
        color: 'white'
      },
      headerStyle: {
        backgroundColor: brandColor,

      },
      headerRightContainerStyle: {
        paddingRight: 15
      },
      headerLeftContainerStyle: {
        paddingLeft: 15
      },
      headerLeft: () => '',
      headerRight: () => {
        return (
          <Pressable onPress={() => navigation.goBack()} className='rounded-full border border-gray-100 py-1 px-2'>
            <Text className='text-base font-bold text-white'>Terminé</Text>
          </Pressable>
        )
      },
    });
    return () => { };
  }, []);

  const { data, isLoading, error, isError } = useBooks();
  const getChapters = (len) => {
    let chapters = []
    for (let i = 1; i <= len; i++) {
      chapters.push(i)
    }
    return chapters
  }


  if (isLoading) return <Loading />
  if (isError) return <ErrorApp error={error} />
  return (
    <View className='flex-1'>
      <FlatList
        data={data?.data.books}
        renderItem={({ item, index }) => (<BookChapters key={item.book_number} navigation={navigation} book={item} />)}
      />
    </View>
  )
}

export default Books