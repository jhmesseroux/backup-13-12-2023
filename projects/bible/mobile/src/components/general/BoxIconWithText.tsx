import { View, Text, Pressable } from 'react-native'
import React from 'react'
import { FullSong } from '../../interfaces/ISongResponse'
import Loading from '../Loading'

const BoxIconWithText = ({ text = '', action, children, data, loading = false }: { text?: string, action: any, children: any, data?: FullSong, loading?: boolean }) => {
  return (
    <Pressable
      className='overflow-hidden'
      onPress={() => {
        if (loading) return
        action()
      }}>
      <View
        style={{ opacity: loading ? 0.3 : 1 }}
        className='bg-white overflow-hidden p-1 w-12 justify-center h-12 shadow-xl  border-b border-gray-100 rounded-full flex items-center flex-column'>
        {
          loading ? <Loading /> : (
            <>
              {children}
              {text.length > 0 && (<Text className='text-xs text-gray-400'>{text}</Text>)}
            </>
          )
        }
      </View>
    </Pressable >
  )
}

export default BoxIconWithText