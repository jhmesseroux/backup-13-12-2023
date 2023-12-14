import { View, Text, TouchableOpacity, Pressable } from 'react-native';
import React from 'react';
import { Swipeable } from 'react-native-gesture-handler';
import Icon from '../icons/Icon';
import { timeSince } from '../../helpers/date';
import { FaveItem } from '../../interfaces/chants/favouriteSongs';
import Loading from '../Loading';

interface Props {
  fave: FaveItem;
  deleteFave: () => void;
  navigation: any;
  isDeleting: boolean;
}
const FaveSong = ({ fave, deleteFave, navigation, isDeleting }: Props) => {
  const renderRightActions = (progress: any, dragX: any) => {
    return (
      <Pressable className='items-center justify-center  rounded-md ml-1'>
        {
          isDeleting ? <Loading /> : (
            <Icon
              name='trash-outline'
              color='red'
              size={45}
              onPress={deleteFave}
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
        onPress={() => navigation.navigate('Song', { song: fave.Song })}
        activeOpacity={0.8}
        className='bg-white p-3 overflow-hidden rounded-md shadow-xl'
      >
        <View className='flex flex-row items-center justify-between'>
          <Text className='text-lg font-semibold text-slate-700'>
            {fave?.Song.num} - {fave.Song.SongCategory.name}
          </Text>
          <Icon
            name='chevron-forward-outline'
            color='violet'
            size={20}
          />
        </View>
        <View className='flex flex-row justify-between items-center pl-2 pb-2'>
          <Text className='text-sm text-gray-400 opacity-90'>{fave.Song.title}</Text>
          <Text className='text-xs text-gray-400 opacity-90 absolute right-0 -bottom-2'>
            {timeSince(fave.createdAt)}
          </Text>
        </View>
      </TouchableOpacity>
    </Swipeable>
  );
};

export default FaveSong;
