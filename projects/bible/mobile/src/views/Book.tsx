import { StyleSheet, Text, View, ScrollView, Modal, Pressable, Share, LayoutRectangle } from 'react-native';
import React, { useEffect, useState } from 'react';

import { StackScreenProps } from '@react-navigation/stack';
import Ionicons from '@expo/vector-icons/Ionicons';
import { EvilIcons } from '@expo/vector-icons';
import { MaterialIcons } from '@expo/vector-icons';
import { MaterialCommunityIcons } from '@expo/vector-icons';

import useBookChapter from '../hooks/useBookChapter';
import { appStyle } from '../theme/appStyle';
import Verse from '../components/Verse';
import { IVerse } from '../interfaces/IBookChapter';

interface Props extends StackScreenProps<any, any> {}

const Book = ({ navigation, route }: Props) => {
  const { book, chapter } = route.params;
  const { bookChapter, loading } = useBookChapter(book, chapter);
  const [showModal, setShowModal] = useState(false);
  const [coordsPopup, setCoordsPopup] = useState<LayoutRectangle>();
  const [selectedVerse, setSelectedVerse] = useState<IVerse>();

  // console.log(book, chapter);

  useEffect(() => {
    navigation.setOptions({
      title: `${book.long_name} - ${chapter}`,
    });
    return () => {};
  }, []);

  const handleClickVerse = (v: IVerse, coords) => {
    setShowModal(true);
    // console.log('heyy', v);
    // console.log(coords);
    setSelectedVerse(v);
    setCoordsPopup(coords);
  };

  const onShare = async () => {
    try {
      const result = await Share.share({
        message: `${book.long_name}  ${selectedVerse.chapter}v: ${selectedVerse.verse} \n ${selectedVerse.text}`,
      });
      if (result.action === Share.sharedAction) {
        if (result.activityType) {
          // console.log('sharedddd');
          // shared with activity type of result.activityType
        } else {
          // console.log('nooo');
          // shared
        }
      } else if (result.action === Share.dismissedAction) {
        // dismissed
      }
    } catch (error) {
      alert(error.message);
    }
  };

  const handleFavoriteVerse = (v: IVerse) => {
    console.log(v);
  };

  return (
    <ScrollView
      // stickyHeaderIndices={[2]}
      showsVerticalScrollIndicator={false}
    >
      <Text style={{ ...appStyle.titleHeader, textAlign: 'center', padding: 20, ...appStyle.primaryColor }}>
        {book.long_name} - {chapter}
      </Text>
      <View style={{ padding: 15 }}>
        {bookChapter?.books?.map((v) => (
          <Verse
            key={v.verse}
            verse={v}
            handleClickVerse={handleClickVerse}
          />
        ))}
      </View>

      <View
        style={{
          ...styles.popupContainer,
          top: coordsPopup?.y ? coordsPopup.y : 0 + Math.floor(coordsPopup?.height ? coordsPopup?.height / 4 : 0),
        }}
      >
        <View
          style={{
            width: 150,
            borderRadius: 15,
            backgroundColor: 'white',
            // paddingVertical: 10,
            // paddingHorizontal: 7,
            display: showModal ? 'flex' : 'none',
            flexDirection: 'row',
            position: 'relative',
            justifyContent: 'center',
            alignItems: 'center',
          }}
        >
          <View style={styles.before}></View>

          <MaterialCommunityIcons
            name='comment-edit-outline'
            onPress={() => console.log(selectedVerse)}
            style={styles.popupIcon}
            size={30}
            color='black'
          />

          <MaterialIcons
            name='favorite-border'
            style={styles.popupIcon}
            onPress={() => handleFavoriteVerse(selectedVerse)}
            size={30}
            color='black'
          />

          <EvilIcons
            name='share-google'
            size={30}
            onPress={() => onShare()}
            style={styles.popupIcon}
            color='black'
          />
        </View>
      </View>
    </ScrollView>
  );
};

export default Book;

const styles = StyleSheet.create({
  popupContainer: {
    justifyContent: 'center',
    alignItems: 'center',
    position: 'absolute',
    left: 0,
    right: 0,
    borderRadius: 20,
  },
  popupIcon: {
    paddingVertical: 10,
    paddingHorizontal: 8,
    backgroundColor: 'white',
    borderRadius: 10,
  },
  before: {
    width: 20,
    height: 20,
    backgroundColor: 'white',
    position: 'absolute',
    bottom: -10,
    left: '50%',
    // right: 0,
    zIndex: 10,
    transform: [{ rotate: '45deg' }],
  },
});
