import { View, Text, Pressable, FlatList, TouchableOpacity } from 'react-native'
import React, { useContext, useEffect } from 'react'
import useVersions from '../../hooks/useGetVersions';
import ErrorApp from '../../components/ErrorApp';
import Loading from '../../components/Loading';
import { BibleContext } from '../../context/bible/bibleContext';
import { StackScreenProps } from '@react-navigation/stack';
import { brandColor } from '../../helpers/variable';
interface Props extends StackScreenProps<any, 'Versions'> { }

const Versions = ({ navigation }: Props) => {
  const { lecture, updateVersion } = useContext(BibleContext)
  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      headerTitleStyle: {
        // display: 'none'
        color: 'white',
        fontSize: 17,
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
      headerLeft: () => {
        return ''
      },
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

  const { data, isLoading, error, isError } = useVersions();

  if (isLoading) return <Loading />
  if (isError) return <ErrorApp error={error} />
  return (
    <View className='flex-1'>
      <FlatList
        data={data?.data}
        renderItem={({ item }) => (
          <TouchableOpacity
            activeOpacity={0.8}
            onPress={() => {
              updateVersion(item);
              // TODO ::  update the label of the bible header to show the text in the selected language
              navigation.navigate('Bible')
            }}
          >
            <View className={`bg-white border-b border-gray-100 p-2 ${lecture.version.file === item.file && 'bg-brand text-white'}`}>
              <View className='flex flex-row justify-between items-center'>
                <Text className={`text-lg font-bold text-slate-700 ${lecture.version.file === item.file && 'text-white'}`}>{item.name}</Text>
                <Text className={`text-base font-semibold text-slate-700  ${lecture.version.file === item.file && 'text-white'}`}>{item.longLanguage}</Text>
              </View>
              <Text className={`text-sm text-gray-400 ${lecture.version.file === item.file && 'text-gray-200'}`}>{item.description}</Text>
            </View>
          </TouchableOpacity>
        )}
      />
    </View>
  )
}

export default Versions