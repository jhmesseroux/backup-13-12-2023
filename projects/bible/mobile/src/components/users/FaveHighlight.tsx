import { View, Text, TouchableOpacity, Pressable } from 'react-native';
import React, { useContext, useState } from 'react';
import { Swipeable } from 'react-native-gesture-handler';
import Icon from '../icons/Icon';
import { timeSince } from '../../helpers/date';
import { cleanHTML } from '../../helpers/text';
import { BibleContext } from '../../context/bible/bibleContext';
import { IFavouriteVerse } from '../../interfaces/bibles/FavouritesVerses';
import Loading from '../Loading';
import { TYPE } from '../../helpers/enums';
import { LinearGradient } from 'expo-linear-gradient';
import { brandColor, brandColor2 } from '../../helpers/variable';
import { formatNumeration } from '../../helpers/general';

interface Props {
  faveHighlight: IFavouriteVerse;
  deleteHighlight: () => void;
  navigation: any;
  isDeleting: boolean;
  type?: string;
}
const FaveHighlight = ({ faveHighlight, deleteHighlight, navigation, isDeleting, type = '' }: Props) => {
  const { updateBook, updateChapter } = useContext(BibleContext);

  const renderRightActions = (progress: any, dragX: any) => {
    return (
      <Pressable className='items-center justify-center  rounded-md ml-1'>
        {
          isDeleting ? <Loading /> : (
            <Icon
              name='trash-outline'
              color='red'
              size={45}
              onPress={deleteHighlight}
            />
          )
        }
      </Pressable>
    );
  };
  return (
    <Swipeable
      renderRightActions={renderRightActions}
      containerStyle={{ marginBottom: 10 }}
    >
      <TouchableOpacity
        activeOpacity={0.8}
        onPress={() => {
          updateChapter(faveHighlight.chapter);
          updateBook({
            book_number: faveHighlight.bookNumber,
            long_name: faveHighlight.bookName,
            chapters: null,
            short_name: null,
            verses: null
          })
          navigation.navigate('Bible', { bookNumber: faveHighlight.bookNumber, chapter: faveHighlight.chapter })
        }
        }
      >
        <View
          className={`bg-white rounded-md mb-4`} >
          {
            type === TYPE.HIGHLIGHT && (
              <LinearGradient
                colors={[faveHighlight.color, 'transparent']}
                // put the gradient left to right 
                start={{ x: 0, y: 0 }}
                // style={{ borderColor: faveHighlight.color, width: 0, height: '100%', borderWidth: 2 }}
                end={{ x: 1, y: 0 }}
                className='w-4  absolute h-full shadow-lg flex items-center justify-center rounded-fullj pr-1 pb-1'>
                <View
                  className='absolute'
                // style={{ borderColor: faveHighlight.color, width: 0, height: '100%', borderWidth: 2 }}
                ></View>
              </LinearGradient>
            )
          }

          <View
            className='flex justify-between flex-row items-center  px-2 py-1'>
            {
              type === TYPE.FAVOURITE && (
                <LinearGradient
                  colors={[brandColor, brandColor2]}
                  // put the gradient left to right 
                  start={{ x: 0, y: 0 }}
                  end={{ x: 1, y: 0 }}
                  className='w-8 h-8 absolute shadow-lg flex items-center justify-center rounded-br-full pr-1 pb-1'>
                  <Icon
                    name='star'
                    color='white'
                    className='m-2 !pr-2'
                    size={20}
                  />
                </LinearGradient>
              )
            }
            <Text
              className='text-sm  font-medium text-slate-600'
              style={{ marginLeft: type === TYPE.FAVOURITE ? 30 : 0 }}
            >
              {faveHighlight.bookName} {faveHighlight.chapter}:{formatNumeration(faveHighlight.verses)} {faveHighlight.version.name}
            </Text>
            <Text className='text-xs text-slate-400'>il y a {timeSince(faveHighlight.createdAt)}</Text>
          </View>
          <View
            className={`flex  mt-1 p-1  gap-x-1 ${type === TYPE.HIGHLIGHT ? 'pl-2' : ''} `}
          // style={{ backgroundColor: faveHighlight.color }}
          >
            {/* <Text>

              {
                JSON.stringify(faveHighlight.texts)
              }
            </Text> */}
            {/* <Text className='absolute bg-red-300 z-20'>
              {'LEN :: ' + faveHighlight.texts.length}
            </Text> */}
            {faveHighlight.texts.map((v, index) => (
              <Text
                key={v.verse}
                className='w-full'
              >
                <Text className='text-xs'> {v.verse} </Text>
                <Text>{cleanHTML(v.text)}</Text>
              </Text>
            ))}
          </View>
        </View>
      </TouchableOpacity>
    </Swipeable>
  )
};

export default FaveHighlight;
