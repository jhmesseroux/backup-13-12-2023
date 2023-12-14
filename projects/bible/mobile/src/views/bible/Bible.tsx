import { StackScreenProps } from '@react-navigation/stack';
import { StatusBar } from 'expo-status-bar';
import React, { useContext, useEffect, useState, useRef, useMemo, useCallback } from 'react';
import { ScrollView } from 'react-native-gesture-handler';
import { LayoutRectangle, Pressable, Text, View } from 'react-native';
import Icon from '../../components/icons/Icon';
import useLecture from '../../hooks/useLecture';


import Verse from '../../components/Verse';
import { IVerse } from '../../interfaces/bibles/versesChapterOfBook';
import { cleanHTML, copyToClipboard } from '../../helpers/text';
import { http } from '../../api/api';
import { AuthContext } from '../../context/auth/AuthContext';
import { BibleContext } from '../../context/bible/bibleContext';
import Loading from '../../components/Loading';
import ErrorApp from '../../components/ErrorApp';
import { brandColor2 } from '../../helpers/variable';
import ShowAlert from '../../components/general/ShowAlert';
import shareComponent from '../../helpers/shareComponent';
import { TYPE } from '../../helpers/enums';
import { dataColors } from '../../helpers/general';
import { BottomSheetModal, BottomSheetModalProvider } from '@gorhom/bottom-sheet';
import { useFavouriteVerses } from '../../hooks/useFavouriteVerses';
interface Props extends StackScreenProps<any, 'Bible'> { }

const Bible = ({ navigation, route }: Props) => {
  const { lecture, updateBook } = useContext(BibleContext);
  const [coordsPopup, setCoordsPopup] = useState<LayoutRectangle>();
  const { user, token, showAlert, toggleFlashAlerts, updateAlertMessage, alertMessage, updateAlertColor, alertColor } = useContext(AuthContext);
  const [selectedVerses, setSelectedVerses] = useState<IVerse[]>([]);
  const fvUser = useFavouriteVerses();
  const [fontSize, setFontSize] = useState(false)
  // console.log('PARAMS ::::: ', route.params)
  const { data, isLoading, error, isError } = useLecture(route?.params?.bookNumber, route?.params?.chapter);


  const handleHighlightFavoriteNote = async (color: string, type: string, note: string = null) => {
    if (!token || !user.id) return navigation.navigate('LoginBeforeAct');
    let _data = {
      UserId: user.id,
      verses: selectedVerses.map((v) => v.verse).join(','),
      texts: selectedVerses,
      note: note,
      color: color,
      type: type,
      bookName: lecture?.book?.long_name,
      bookNumber: lecture?.book?.book_number,
      version: lecture.version,
      chapter: lecture?.chapter,
    };
    try {
      const res = await http.post(`/bible/favourites`, _data, { headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + token } });
      if (res.data.ok) {
        // handlePresentModalPress()
        // updateAlertColor('bg-green-500');
        updateAlertMessage('Surbrillance sauvegardé avec succès');
        toggleFlashAlerts(true);
        setSelectedVerses([]);
        fvUser.refetch();
      }
    } catch (error) {
      if (error.response) {
        console.log('Error : ', error.response.data);
        updateAlertColor('bg-red-500');
        updateAlertMessage(error.response.data.message || 'Une erreur est survenue. Veuillez réessayer');
        toggleFlashAlerts(true);
      }
    }
  };

  const dataAction = [
    {
      text: 'Copier',
      onPress: () => {
        copyToClipboard(
          lecture.book.long_name + ' ' + lecture.chapter + ' : ' +
          selectedVerses.map((v) => v.verse).join(',') + ' ' + lecture.version.name + '\n' +
          cleanHTML(
            selectedVerses
              .map((v) => v.verse + '- ' + v.text + '\n')
              .join(' '))

        );

        updateAlertMessage('Verset(s) copié avec succès');
        toggleFlashAlerts(true);
        // TODO: add app link down
        setSelectedVerses([]);
      },
    },
    {
      text: 'Partager',
      onPress: () => {
        shareComponent(
          lecture.book.long_name + ' ' + lecture.chapter + ' : ' +
          selectedVerses.map((v) => v.verse).join(',') + ' ' + lecture.version.name + '\n' +
          cleanHTML(
            selectedVerses
              .map((v) => v.verse + '- ' + v.text + '\n')
              .join(' '))
        )
      },
      // TODO: add app link down

    },
    {
      text: 'Favori',
      onPress: () => handleHighlightFavoriteNote(brandColor2, TYPE.FAVOURITE)
    },
    {
      text: 'Note',
      onPress: () => {
        if (!token || !user.id) return navigation.navigate('LoginBeforeAct');

        let _data = {
          UserId: user.id,
          verses: selectedVerses.map((v) => v.verse).join(','),
          texts: selectedVerses,
          note: null,
          color: null,
          type: TYPE.NOTE,
          bookName: lecture?.book?.long_name,
          bookNumber: lecture?.book?.book_number,
          version: lecture.version,
          chapter: lecture?.chapter,
        };

        setSelectedVerses([]);
        navigation.navigate('Note', { data: _data })
      },
    },
    // {
    //   text: 'Image',
    //   onPress: () => {
    //     console.log('hello');
    //   },
    // },
  ];

  const handleGenerateVDJ = async () => {
    if (!token || !user.id) return navigation.navigate('LoginBeforeAct');
    let _data = {
      verses: selectedVerses.map((v) => v.verse).join(','),
      texts: selectedVerses,
      bookName: lecture?.book?.long_name,
      bookNumber: lecture?.book?.book_number,
      version: lecture.version,
      chapter: lecture?.chapter,
    };

    // return

    try {
      const res = await http.post(`/verse-of-the-day`, _data, { headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + token } });
      if (res.data.ok) {
        // handlePresentModalPress()
        updateAlertMessage('Verset du jour sauvegardé avec succès');
        toggleFlashAlerts(true);
        setSelectedVerses([]);
      }
    } catch (error) {
      if (error.response) {
        console.log('Error : ', error.response.data);
        updateAlertColor('bg-red-500');
        updateAlertMessage(error.response.data.message || 'Une erreur est survenue. Veuillez réessayer');
        toggleFlashAlerts(true);
      }
    }

  }

  const bottomSheetModalRef = useRef<BottomSheetModal>(null);
  const snapPoints = useMemo(() => ["30%", "50%"], []);
  const handleSheetChanges = useCallback((index: number) => {
    // console.log("handleSheetChanges", index);
  }, []);

  const handlePresentModalPress = () => {
    // console.log('selectedddddddddddddddddddddddddddddddddddddd')
    if (selectedVerses.length === 0) {
      // console.log('00000000000000000000000000000000000000000000000000')
      bottomSheetModalRef.current?.dismiss();
    } else {
      // console.log('111111111111111111111111111111111111111111111')
      bottomSheetModalRef.current?.present();
    }
  };

  useEffect(() => {
    // console.log('efectttttttttttttttttttttttttttttt')
    console.log(fvUser?.data?.data)
    handlePresentModalPress()
    // return () => { bottomSheetModalRef.current?.dismiss(); }
  }, [selectedVerses, setSelectedVerses])




  if (isLoading) return <Loading />;
  if (isError) return <ErrorApp error={error} />;

  return (
    <>

      <BottomSheetModal
        ref={bottomSheetModalRef}
        name='selectedVersesModal'
        index={0}
        // add bottom inset to elevate the sheet
        // bottomInset={36}
        // set `detached` to true
        // detached={true}
        onDismiss={() => setSelectedVerses([])}
        snapPoints={snapPoints}
        onChange={handleSheetChanges}
        backgroundStyle={{ backgroundColor: 'white' }}

      >
        <View className='p-4 flex flex-row justify-between items-center'>
          <Text className='font-semibold'>
            {lecture?.book?.long_name} {lecture?.chapter} : {' '}
            {selectedVerses
              .sort((a, b) => a.verse - b.verse)
              .map((j) => j.verse)
              .join(',')}
          </Text>
          {/* <Text>Selected : {selectedVerses.length}</Text> */}
          {/* <Icon name='close' extraclass='!absolute right-3 top-0' onPress={() => setSelectedVerses([])} /> */}
        </View>

        {/* actions */}
        <View className=''>
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
            className='p-1'
          >
            {dataAction.map((item, i) => (
              <Pressable
                key={i}
                className='font-medium text-base h-fit rounded-full  bg-gray-200 p-2 ml-2'
                onPress={item.onPress}
              >
                <Text> {item.text} </Text>
              </Pressable>
            ))}

            {
              (!!token && (user.role === 'admin' || user.role === 'manager')) && (
                <Pressable
                  key={token}
                  className='font-medium text-base h-fit rounded-full  bg-gray-200 p-2 ml-2'
                  onPress={handleGenerateVDJ}
                >
                  <Text>VDJ</Text>
                </Pressable>
              )
            }
          </ScrollView>
        </View>
        {/* colors */}
        <View className='my-6 mb-12'>
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
          >
            {dataColors.map((item, i) => (
              <Pressable
                key={i}
                style={{ backgroundColor: item }}
                className='font-medium text-base w-10 h-10 bg-gray-200    rounded-full   p-2 ml-2'
                onPress={() => handleHighlightFavoriteNote(item, TYPE.HIGHLIGHT)}
              />
            ))}
          </ScrollView>
        </View>
      </BottomSheetModal>
      <View className='flex-1 ' style={{}}>
        <StatusBar style='auto' />

        {/* <View
          className='absolute bottom-0 bg-white shadow-lg w-full  h-[200px] '
          style={{
            display: selectedVerses.length ? 'flex' : 'none',
            width: '100%',
            borderTopEndRadius: 10,
            borderTopStartRadius: 10,
            zIndex: 99999
          }}
        >        
        </View> */}

        <ScrollView
          showsVerticalScrollIndicator={false}
          stickyHeaderHiddenOnScroll
          stickyHeaderIndices={[0]}
        >
          <View className='flex flex-row justify-between items-center bg-brand2 pt-10 pb-2 px-3'>
            <View className='rounded-full bg-white shadow flex flex-row items-center'>
              <Pressable
                onPress={() => {
                  setSelectedVerses((prev) => []);
                  navigation.navigate('Books' as never)
                }}
                className='border-r-2 pr-1 border-gray-300 p-2'
              >
                <Text>
                  {lecture?.book?.long_name} {lecture?.chapter}
                </Text>
              </Pressable>
              <Pressable
                className='pr-1 p-2'
                onPress={() => {
                  setSelectedVerses((prev) => []);
                  navigation.navigate('Versions' as never)
                }}
              >

                <Text>{lecture?.version?.name}</Text>
              </Pressable>
            </View>
            <View>
              <Pressable >
                <Icon onPress={() => setFontSize(prev => !prev)} name='reader-outline' color='white' />
              </Pressable>
            </View>
          </View>

          <View className='px-4 pt-4 bg-gray-200  min-h-screen pb-[200px]'>
            <View className=''>
              {data?.data?.verses?.map((v, index) => (
                <Verse
                  key={index}
                  selectedVerses={selectedVerses}
                  setSelectedVerses={setSelectedVerses}
                  verse={v}
                  size={fontSize}
                  isFV={fvUser?.data?.data?.find((fv) => fv.bookNumber === v.book_number && fv.chapter === v.chapter && fv.verses.split(',').includes(v.verse.toString()))}
                  bottomSheetModalRef={bottomSheetModalRef}
                />
              ))}
            </View>
          </View>
        </ScrollView>
      </View>
      {showAlert && <ShowAlert text={alertMessage} color={alertColor} />}

    </>

  );
};

export default Bible;