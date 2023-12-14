import React, { useEffect, useState, useContext } from 'react';
import { Modal, Pressable, ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';

import Ionicons from '@expo/vector-icons/Ionicons';

import { Book } from '../interfaces/IVersions';
import ChapterItem from './ChapterItem';
import { appStyle } from '../theme/appStyle';
import { ThemeContext } from '../context/theme/ThemeContext';

interface Props {
  book: Book;
}

const BookItem = ({ book }: Props) => {
  const [showModal, setShowModal] = useState(false);
  const [chaptersNumbers, setChaptersNumbers] = useState([]);
  const { theme, setDarkTheme, setLightTheme } = useContext(ThemeContext);

  const generateArray = (items: number) => {
    let result = [];
    for (let i = 1; i <= items; i++) {
      result.push(i);
    }
    return result;
  };
  const handleSelectBook = () => {
    setShowModal(true);
  };

  return (
    <>
      <TouchableOpacity
        activeOpacity={0.9}
        onPress={handleSelectBook}
      >
        <View style={{ ...styles.book, backgroundColor: theme.colors.background }}>
          <Text style={{ ...styles.bookText, color: theme.colors.text }}>{book.long_name}</Text>
        </View>
      </TouchableOpacity>

      <Modal
        animationType='slide'
        transparent={true}
        visible={showModal}
        style={{ backgroundColor: 'rgba(0,0,0,1)' }}

        // presentationStyle="fullScreen"
      >
        <View style={{ backgroundColor: 'rgba(0,0,0,0.2)', flex: 1, opacity: 1 }}>
          <View style={{ ...styles.modalContainer }}>
            <Pressable
              style={{ position: 'absolute', right: 10, top: 10 }}
              onPress={() => setShowModal(false)}
            >
              <Text
                style={{
                  fontSize: 20,
                  fontWeight: 'bold',
                  ...appStyle.primaryColor,
                  backgroundColor: 'rgba(0, 0, 0, 0.12)',
                  width: 30,
                  height: 30,
                  borderRadius: 1000,
                  textAlign: 'center',
                }}
              >
                X
              </Text>
            </Pressable>
            <View style={{ marginBottom: 10, justifyContent: 'center', alignItems: 'center' }}>
              <Text style={appStyle.titleHeader}>{book.long_name}</Text>
              <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'center' }}>
                <Ionicons
                  name='book'
                  size={25}
                  style={appStyle.primaryColor}
                />
                <Text style={{ fontSize: 15, fontWeight: '500', marginLeft: 10 }}>{book.chapters} Chapitres</Text>
              </View>
            </View>
            <ScrollView showsVerticalScrollIndicator={false}>
              <View style={{}}>
                {generateArray(book.chapters).map((chapter: number) => (
                  <ChapterItem
                    key={chapter}
                    book={book}
                    closeModal={() => setShowModal(false)}
                    chapter={chapter}
                  />
                ))}
              </View>
            </ScrollView>
          </View>
        </View>
      </Modal>
    </>
  );
};

export default BookItem;

const styles = StyleSheet.create({
  book: {
    // backgroundColor: 'white',
    padding: 10,
    marginVertical: 2,
    borderRadius: 20,
    shadowColor: '#000',
    // shadowOffset: {
    //   width: 0,
    //   height: 1,
    // },
    // shadowOpacity: 0.2,
    // shadowRadius: 1.41,

    // elevation: 2,
  },
  bookText: {
    fontSize: 18,
    color: '#06283D',
  },
  modalContainer: {
    flex: 1,
    backgroundColor: '#F7F7F7',
    padding: 15,
    height: '70%',
    width: '100%',
    position: 'absolute',
    bottom: 0,
    borderTopRightRadius: 20,
    borderTopLeftRadius: 20,
  },
});
