import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';
import React from 'react';
import { useNavigation } from '@react-navigation/native';

const ChapterItem = ({ chapter, book, closeModal }: any) => {
  const navagation = useNavigation();
  // console.log(book, chapter);

  return (
    <TouchableOpacity
      activeOpacity={0.7}
      style={styles.chapterBox}
      onPress={() => {
        closeModal();
        navagation.navigate('Book', { book, chapter });
      }}
    >
      <Text style={styles.chapterText}>Chapter {chapter} </Text>
    </TouchableOpacity>
  );
};

export default ChapterItem;

const styles = StyleSheet.create({
  chapterBox: {
    backgroundColor: 'white',
    padding: 10,
    marginVertical: 2,
    borderRadius: 20,
    shadowColor: '#000',
    // shadowOffset: {
    //   width: 0,
    //   height: 1,
    // },
    // shadowOpacity: 0.20,
    // shadowRadius: 1.41,

    // elevation: 2,
  },
  chapterText: {
    fontSize: 18,
    color: '#06283D',
  },
});
