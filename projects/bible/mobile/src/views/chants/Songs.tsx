import { ScrollView, View, Text, Pressable } from 'react-native'
import React, { useEffect, useState } from 'react'
import { StackScreenProps } from '@react-navigation/stack';
import { StatusBar } from 'expo-status-bar';
import { ISong } from '../../interfaces/ISongsBook';
import ErrorApp from '../../components/ErrorApp';
import CustomInput from '../../components/CustomInput';
import useForm from '../../hooks/useForm';
import Loading from '../../components/Loading';
import { useSongs } from '../../hooks/useSongs';
import Song from '../../components/chants/Song';
import Icon from '../../components/icons/Icon';
import { brandColor, brandColor2 } from '../../helpers/variable';
import { removeAccents } from '../../helpers/text';

interface Props extends StackScreenProps<any, 'Songs'> { }

const Songs = ({ navigation, route }: Props) => {

  const { params } = route;
  const { onChange, search } = useForm({ search: '' })
  const { songsQuery } = useSongs(params.id)
  const [creoles, setCreoles] = useState([])
  const [frenchs, setFrenchs] = useState([])
  const [selectedLanguage, setSelectedLanguage] = useState<'fr' | 'ht'>('fr');

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: params.cateName,
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: brandColor,
      },
      headerLeft: (props) => (
        <Icon
          name='chevron-back-outline'
          color='white'
          {...props}
          onPress={() => navigation.goBack()}
        />
      ),
    });
    return () => { };
  }, []);

  useEffect(() => {
    if (search.length == 0) {
      setCreoles(songsQuery?.data?.data.filter(s => s.language === 'ht'))
      setFrenchs(songsQuery?.data?.data.filter(s => s.language === 'fr'))
      return;
    }
    setCreoles(songsQuery.data.data.filter(s => (removeAccents(s.num.toString().concat(' ' + s.title.toLocaleLowerCase())).includes(removeAccents(search.toLocaleLowerCase()))) && s.language === 'ht'))
    setFrenchs(songsQuery.data.data.filter(s => (removeAccents(s.num.toString().concat(' ' + s.title.toLocaleLowerCase())).includes(removeAccents(search.toLocaleLowerCase()))) && s.language === 'fr'))
    return () => { }
  }, [search, songsQuery.data])
  if (songsQuery.isLoading) return <Loading color={brandColor} />
  if (songsQuery.isError) return <ErrorApp error={songsQuery.error} />

  return (
    <ScrollView stickyHeaderHiddenOnScroll stickyHeaderIndices={[1]} showsVerticalScrollIndicator={false}>
      <StatusBar style='light' />
      <View className=''>
        <CustomInput placeholder='Ekri nimewo ubyen tit chan : 10,Gloire a Dieu,225'
          // label='search'
          className='bg-red-300 p-2'
          error=''
          name='search'
          onChange={onChange}
          CStyles={{ marginTop: 0, marginBottom: 0, borderRadius: 0 }}
        />
        <View className='flex flex-row  justify-start items-center  bg-white rounded-md shadow overflow-hidden border-t border-gray-100 p-2 mb-3'>
          {
            ['fr', 'ht'].map((item: string, index: number) => {
              return (
                <View className={`border-gray-200 mr-4  rounded-full`} key={index}>
                  {/* @ */}
                  <Pressable className='p-3 border rounded-full border-gray-300' onPress={() => setSelectedLanguage(item === 'fr' ? 'fr' : 'ht')}
                    style={{ backgroundColor: selectedLanguage === 'fr' ? item === 'fr' ? brandColor : 'white' : item === 'ht' ? brandColor2 : 'white' }}
                  >
                    <Text className={`text-gray-200 font-bold`}>{item === 'fr' ? 'Français' : 'Creole'}</Text>
                  </Pressable>
                </View>
              )
            })
          }
        </View>
      </View>
      {
        songsQuery?.data?.results > 0 ? (
          <View className='mx-3'>
            <View className='rounded-xl ios:bg-white bg-white p-2  mb-[90px]  overflow-hidden'>
              {
                (search?.length > 0 && creoles?.length === 0 && frenchs?.length === 0) ? (
                  <View className='flex flex-col items-center justify-center'>
                    <Text className='text-brand text-lg'>Pa gen rezilta pou : <Text className='text-brand2 underline'> {search.toLocaleLowerCase()} </Text></Text>
                  </View>
                )
                  : (
                    selectedLanguage === 'fr'
                      ? (
                        (search?.length > 0 && frenchs?.length === 0)
                          ? (<View className='flex flex-col items-center justify-center'>
                            <Text className='text-brand text-lg'>Pa gen rezilta pou : <Text className='text-brand2 underline'> {search.toLocaleLowerCase()} </Text> lan seksyon Français a</Text>
                          </View>
                          ) : (frenchs?.map((song: ISong, index: number) => <Song key={index} cateName={params.cateName} song={song} color={brandColor} navigation={navigation} />))
                      )
                      : (
                        (search?.length > 0 && creoles?.length === 0)
                          ? (<View className='flex flex-col items-center justify-center'>
                            <Text className='text-brand text-lg'>Pa gen rezilta pou : <Text className='text-brand2 underline'>{search.toLocaleLowerCase()} </Text>lan seksyon creole la</Text>
                          </View>)
                          : (creoles?.map((song: ISong, index: number) => <Song key={index} cateName={params.cateName} song={song} color={brandColor2} navigation={navigation} />))
                      )
                  )
              }
            </View>
          </View>
        ) : (
          <View className='flex flex-col items-center justify-center h-[100px]'>
            <Text className='text-gray-500 text-lg'>Pa gen chan nan kategori : {params.cateName}</Text>
          </View>
        )
      }
    </ScrollView>
  )
}

export default Songs

