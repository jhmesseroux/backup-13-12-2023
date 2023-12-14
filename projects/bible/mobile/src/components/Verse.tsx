import React, { useState } from 'react';
import { useWindowDimensions, Pressable, LayoutRectangle, Text } from 'react-native';
import RenderHtml from 'react-native-render-html';
import { IVerse } from '../interfaces/bibles/versesChapterOfBook';
import { cleanHTML } from '../helpers/text';
import { BottomSheetModal } from '@gorhom/bottom-sheet';
import { IFavouriteVerse } from '../interfaces/bibles/FavouritesVerses';
import { TYPE } from '../helpers/enums';
import IconOnly from './icons/IconOnly';
interface Props {
  verse: IVerse;
  selectedVerses: IVerse[];
  setSelectedVerses: any;
  size: boolean,
  isFV: IFavouriteVerse,
  bottomSheetModalRef: React.RefObject<BottomSheetModal>;
}

const Verse = ({ verse, selectedVerses, setSelectedVerses, size, bottomSheetModalRef, isFV }: Props) => {
  const { width: windowWidth } = useWindowDimensions();
  const [coords, setCoords] = useState<LayoutRectangle>();
  console.log('VERSE ', verse.verse, ' isFv :: ', isFV)
  const tagsStyles = {
    body: {
      whiteSpace: 'normal',
      color: 'black',
      fontSize: size ? 20 : 16,
      textDecorationLine: selectedVerses.find(v => v.verse === verse.verse) ? 'underline' : 'none',
      textDecorationStyle: selectedVerses.find(v => v.verse === verse.verse) ? 'solid' : '',
      textDecorationColor: selectedVerses.find(v => v.verse === verse.verse) ? '#060047' : '',
      backgroundColor: isFV ? '#060047' : '',
    },
  };
  return (
    <Pressable
      style={{ marginBottom: 5 }}
      onPress={() => {
        if (selectedVerses.find(v => v.verse === verse.verse)) {
          setSelectedVerses(prev => prev.filter(v => v.verse !== verse.verse));
        } else {
          setSelectedVerses(prev => [...prev, verse]);
        }
      }}
      onLayout={(event) => {
        const layout = event.nativeEvent.layout;
        setCoords(layout);
      }}
    >
      {/* <Text>
        {verse.verse}.. {cleanHTML(verse.text)}
      </Text> */}
      <Text
        style={{
          fontSize: size ? 20 : 16,
          textDecorationLine: selectedVerses.find(v => v.verse === verse.verse) ? 'underline' : 'none',
          // textDecorationStyle: selectedVerses.find(v => v.verse === verse.verse) ? 'solid' : '',
          textDecorationColor: selectedVerses.find(v => v.verse === verse.verse) ? '#060047' : '',
          backgroundColor: (isFV && isFV.type === TYPE.HIGHLIGHT) ? isFV.color : '',

        }}
        className='p-1'
      >
        <Text
          className={`text-xs text-gray-400 `}
        >
          {(isFV && isFV.type === TYPE.FAVOURITE) ? (<IconOnly name="star" color={isFV.color} size={15} />) : ''}
          {(isFV && isFV.type === TYPE.NOTE) ? (<IconOnly name="chatbox-ellipses-outline" color={isFV.color || 'gray'} size={15} />) : ''}
          {verse.verse + ' '}
        </Text>
        {cleanHTML(verse.text)}
      </Text>


      {/* <RenderHtml
        contentWidth={windowWidth}
        source={{ html: `${verse.verse}.${cleanHTML(verse.text)}` }}
        // source={{
        //   html: `${verse.verse}.${verse.text
        //     .replace(/<pb\/>/g, '')
        //     .replace(/<f\/>/g, '<sub/>')
        //     .replace(/<f>/g, '<sub>')
        //     .replace(/<t\/>/g, '<strong/>')
        //     .replace(/<t>/g, '<strong>')}`,
        // }}
        tagsStyles={tagsStyles as never}
      /> */}
    </Pressable>
  );
};

export default Verse;