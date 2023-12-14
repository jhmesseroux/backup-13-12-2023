import { View, Text, Pressable, ScrollView } from 'react-native'
import React, { useEffect } from 'react'
import { brandColor, brandColor2 } from '../../helpers/variable';
import { StackScreenProps } from '@react-navigation/stack';
import Icon from '../../components/icons/Icon';
import { cleanHTML } from '../../helpers/text';
import { formatNumeration } from '../../helpers/general';
import { timeSince } from '../../helpers/date';
import CustomInput from '../../components/CustomInput';
interface Props extends StackScreenProps<any, 'NoteDetails'> { }

const NoteDetails = ({ navigation, route }: Props) => {
    const { note } = route.params;
    useEffect(() => {
        navigation.setOptions({
            headerShown: true,
            headerTitle: ' ' + note.note,
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
            headerLeft: (props) => (
                <Icon
                    name='chevron-back-outline'
                    color={'white'}
                    {...props}
                    onPress={() => navigation.goBack()}
                />
            ),
        });
        return () => { };
    }, []);
    return (
        <ScrollView className='flex-1  '>
            <View
                className={`bg-white rounded-md mb-20  p-6`} >

                <View
                    className='flex justify-between flex-row items-center  px-2 py-1'>

                    <Text
                        className='text-sm  font-medium text-slate-600'

                    >
                        {note.bookName} {note.chapter}:{formatNumeration(note.verses)} {note.version.name}
                    </Text>
                    <Text className='text-xs text-slate-400'>il y a {timeSince(note.createdAt)}</Text>
                </View>
                <View
                    className={`flex  mt-1 p-1  gap-x-1 `}
                // style={{ backgroundColor: faveHighlight.color }}
                >

                    <View>
                        {note.texts.map((v, index) => (
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

                <Pressable
                    onPress={() => { navigation.navigate('Note', { data: note }) }}
                    className='bg-gray-200 p-3 my-3 rounded'
                >
                    <Text> {note.note} </Text>

                </Pressable>

            </View>

        </ScrollView>
    )
}

export default NoteDetails