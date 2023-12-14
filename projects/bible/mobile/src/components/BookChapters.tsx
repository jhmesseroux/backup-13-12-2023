import React, { useContext, useState } from 'react'
import { Text, TouchableOpacity, View, Pressable } from 'react-native'
import IconOnly from './icons/IconOnly'
import { BibleContext } from '../context/bible/bibleContext'

type Props = {
    book: any,
    navigation: any
}

const BookChapters = ({ book, navigation }: Props) => {
    const { lecture, updateBook, updateChapter } = useContext(BibleContext)
    const [showChapters, setShowChapters] = useState(false)

    const getChapters = (len) => {
        let chapters = []
        for (let i = 1; i <= len; i++) {
            chapters.push(i)
        }
        return chapters
    }
    return (
        <TouchableOpacity
            activeOpacity={0.8}
            onPress={() => {
                setShowChapters(!showChapters)
            }}
        >
            <View className={`bg-white border-b border-gray-100  `}>
                <View className='flex flex-row justify-between items-center bg-gray-200 p-2'>
                    <Text className={`text-lg font-bold text-slate-700 ${lecture?.book?.book_number === book.book_number && 'text-brand'}`}>{book.long_name}</Text>
                    <View className='flex flex-row gap-1 items-center justify-center'>
                        <Text className={`text-base font-semibold text-slate-700  ${lecture?.book?.book_number === book.book_number && 'text-brand'}`}>{book.chapters}</Text>
                        <IconOnly name={showChapters ? 'chevron-up-outline' : 'chevron-down-outline'} size={20} />
                    </View>
                </View>
                {
                    showChapters && (
                        <View
                            className='flex gap-2 flex-row flex-wrap my-2 px-2'

                        >
                            {
                                getChapters(book.chapters).map((chapter, index) => (
                                    <Pressable
                                        key={chapter}
                                        className='w-[50px] h-[50px] border border-gray-200 flex items-center justify-center rounded-md'
                                        onPress={() => {
                                            updateBook(book);
                                            updateChapter(chapter);
                                            navigation.navigate('Bible', { bookNumber: book.book_number, chapter })
                                        }}
                                    >
                                        <Text key={index} className={`text-base text-slate-700 ${(lecture?.book?.book_number === book.book_number && lecture?.chapter === chapter) && 'text-brand'}`}>{chapter}</Text>
                                    </Pressable>
                                ))
                            }
                        </View>
                    )
                }

            </View>
        </TouchableOpacity>
    )
}

export default BookChapters