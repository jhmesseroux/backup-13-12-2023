import { Text, View } from 'react-native'
import { IVotd } from '../interfaces/bibles/VerseOgTheDay'
import Icon from './icons/Icon'
import { formatNumeration } from '../helpers/general'
import { timeSince } from '../helpers/date'
import { cleanHTML } from '../helpers/text'
import { brandColor } from '../helpers/variable'
import shareComponent from '../helpers/shareComponent'

interface Props {
    votd: IVotd,
    onPressMore: (v: IVotd) => void
}

const VerseOfTheDay = ({ votd, onPressMore }: Props) => {

    return (
        <View className='bg-white  border-b-2 border-gray-100 mb-2 p-4 rounded-md shadow-md'>
            <View className='flex flex-row justify-between  items-center mb-2'>
                <View className='flex flex-row gap-2 items-center justify-center '>
                    <View className=''>
                        <Icon name='sunny-outline' color={brandColor} size={25} />
                    </View>
                    <Text className='font-bold'>{votd.bookName} {votd.chapter}:{formatNumeration(votd.verses)} {votd.version.name} </Text>
                </View>
                <Text>{timeSince(votd.createdAt)}</Text>
            </View>
            <Text className=''>
                {
                    votd.texts.map((verse, index) => (
                        <Text key={verse.verse}>
                            <Text key={verse.verse}> <Text className='text-xs text-gray-400'>{verse.verse}</Text> {cleanHTML(verse.text)}</Text>
                        </Text>
                    ))
                }
            </Text>
            <View className='items-end mt-2 flex-row justify-end '>
                {/* TODO :: add link web page  */}
                <Icon name='share-outline' onPress={() => shareComponent(`${votd.texts.map(v => cleanHTML(v.text)).join('')} \n${votd.bookName} ${votd.chapter}:${formatNumeration(votd.verses)} ${votd.version.name}`)} color={brandColor} size={25} />
                <Icon name='ios-image-outline' color={brandColor} size={25} extraclass='ml-6' />
                <Icon name='ellipsis-vertical' color={brandColor} size={25} extraclass='ml-6' onPress={() => onPressMore(votd)} />
            </View>
        </View>
    )
}

export default VerseOfTheDay
