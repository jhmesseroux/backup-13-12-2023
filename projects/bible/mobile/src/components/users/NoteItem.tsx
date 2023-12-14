import { View, Text, TouchableOpacity, Pressable } from 'react-native';
import { Swipeable } from 'react-native-gesture-handler';
import Icon from '../icons/Icon';
import { timeSince } from '../../helpers/date';
import { IFavouriteVerse } from '../../interfaces/bibles/FavouritesVerses';
import Loading from '../Loading';
import { VISIBILITY } from '../../helpers/enums';
import { LinearGradient } from 'expo-linear-gradient';
import { brandColor, brandColor2 } from '../../helpers/variable';

interface Props {
  note: IFavouriteVerse;
  deleteNote: () => void;
  navigation: any;
  isDeleting: boolean;
  type?: string;
}
const NoteItem = ({ note, deleteNote, navigation, isDeleting, type = '' }: Props) => {


  const renderRightActions = (progress: any, dragX: any) => {
    return (
      <Pressable className='items-center justify-center  rounded-md ml-1'>
        {
          isDeleting ? <Loading /> : (
            <Icon
              name='trash-outline'
              color='red'
              size={45}
              onPress={deleteNote}
            />
          )
        }
      </Pressable>
    );
  };
  return (
    <Swipeable
      renderRightActions={renderRightActions}
      containerStyle={{ marginBottom: 0 }}
    >
      <TouchableOpacity
        activeOpacity={0.8}
        onPress={() => { navigation.navigate('NoteDetails', { note: note }) }
        }
      >
        <View
          className={`bg-white flex flex-row  border-b border-gray-200 gap-2 p-3`} >
          {
            note.visibility === VISIBILITY.PRIVATE && (
              <LinearGradient
                colors={[brandColor, brandColor2]}
                // put the gradient left to right 
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 0 }}
                className='w-6 h-6   shadow-lg flex items-center justify-center rounded-full '>
                <Icon
                  name='md-lock-closed-outline'
                  color='white'
                  size={17}
                />
              </LinearGradient>
            )
          }
          <View className='flex-1 '>
            <Text className=''> {note.note}  {note.note.length > 150 ? '...' : ''}</Text>
          </View>
          <Text className='text-xs text-slate-400'>{timeSince(note.createdAt)}</Text>
        </View>
      </TouchableOpacity>
    </Swipeable>
  )
};

export default NoteItem;
