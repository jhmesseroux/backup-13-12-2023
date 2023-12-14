import { Text, View, TouchableOpacity } from 'react-native'
import React from 'react'
import { getColorBox } from '../../helpers/general'
import { ICategory } from '../../interfaces/ChantCategoriesResponse'
import { useNavigation } from '@react-navigation/native';

const Category = ({ cate }: { cate: ICategory }) => {
  const navigation = useNavigation();

  return (
    <View
      style={{}}
      className={`flex flex-col mb-1 shadow-2xl shadow-gray-300 bg-white  rounded-xl border border-gray-200 dark:bg-slate-800 dark:border-slate-600 !text-slate-300 `}
    >
      <TouchableOpacity
        // @ts-expect-error
        onPress={() => navigation.navigate('Songs' as never, { id: cate.id, cateName: cate.name } as never)}
        className='book-item truncate  items-center p-2 flex flex-row gap-2 '
      >
        <View
          style={{ borderColor: getColorBox(cate.abbreviation), borderWidth: 2, borderRadius: 50 }}
          className='w-12 h-12 text-center truncate  flex items-center justify-center  '
        >
          <Text
            style={{ color: getColorBox(cate.abbreviation) }}
            className='text-lg font-extrabold opacity-80 '>{cate.abbreviation}</Text>
        </View>
        <Text className='text-base truncate  overflow-visible font-semibold text-slate-700 text-left'>{cate.name}</Text>
      </TouchableOpacity>
    </View>
  )
}

export default Category

