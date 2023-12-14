import { Share, Pressable, useWindowDimensions, View, Platform, ScrollView, Alert, Text, RefreshControl } from 'react-native';
import React, { useEffect, useState, useContext } from 'react';
import { EvilIcons } from '@expo/vector-icons';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { Ionicons } from '@expo/vector-icons';
import { SimpleLineIcons } from '@expo/vector-icons';
import * as Linking from 'expo-linking';
import { StackScreenProps } from '@react-navigation/stack';
import RenderHTML from 'react-native-render-html';
import { http } from '../../api/api';
import { copyToClipboard } from '../../helpers/text';
import BoxIconWithText from '../../components/general/BoxIconWithText';
import { AuthContext } from '../../context/auth/AuthContext';
import Icon from '../../components/icons/Icon';
import { StatusBar } from 'expo-status-bar';
import { PrimaryColor, brandColor } from '../../helpers/variable';
import ShowAlert from '../../components/general/ShowAlert';
import { ISong } from '../../interfaces/ISongsBook';
import { useUsersFavouritesSongs } from '../../hooks/useUsersFavouritesSongs';
import shareComponent from '../../helpers/shareComponent';
import Loading from '../../components/Loading';

interface Props extends StackScreenProps<any, 'Song'> { }

const Song = ({ navigation, route }: Props) => {
  const { params } = route;
  const cateName = params.cateName
  const [song, setSong] = useState(params.song)

  // console.log('SOng title ::: ', song.title, ' cateName : ', cateName)

  const { width: windowWidth } = useWindowDimensions();
  const [fontSize, setFontSize] = useState(false)
  const [loadingFavorite, setLoadingFavorite] = useState(false)
  const [loadingLike, setLoadingLike] = useState(false)
  const [loadingSong, setLoadingSong] = useState(false)
  const [refreshPage, setRefreshPage] = React.useState<any>(); // TODO ::  use useref 
  const { user, token, alertMessage, alertColor, updateAlertMessage, toggleFlashAlerts, showAlert, updateAlertColor } = useContext(AuthContext);

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: song.title,
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: brandColor,
      },
      headerLeft: (props) => (
        <Icon
          name='chevron-back-outline'
          color='white'
          {...props}
          onPress={() => navigation.goBack()}
        />
      ),
    });
    return () => { };
  }, [])

  useEffect(() => {
    try { http.put(`/songs/${song.id}/add-views`).then((res) => { }) } catch (error) { }
    return () => { }
  }, [])


  const refetchSong = async () => {
    setLoadingSong(true)
    try {
      const res = await http.get(`/songs/${song.id}`);
      if (res.data.ok) {
        setRefreshPage(!refreshPage)
        setSong(res.data.data)
        // song = res.data.data
      }
    } catch (error) {
      updateAlertColor('bg-red-500')
      updateAlertMessage('Erreur lors de la tentative d\'actualization des infos. ') // TODO ::  show message from the backend 
      toggleFlashAlerts(true)
      console.log('error :: ', error)
    } finally {
      setLoadingSong(false)
    }
  }


  const userFavouriteSong = useUsersFavouritesSongs(user?.id, song?.id, token)
  // console.log('useFave :: ', userFavouriteSong?.data)
  // const tagsStyles = {
  //   body: {
  //     whiteSpace: 'normal',
  //     textAlign: 'center',
  //     fontSize: fontSize ? (Platform.OS === 'ios' ? 18 : 20) : Platform.OS === 'ios' ? 13 : 15,
  //     zIndex: 9999,
  //     position: 'relative'
  //   },
  // };

  const shareSong = async () => await shareComponent(`${song.num} ${song.language == 'ht' ? 'Creole' : 'français'} - ${cateName}\n\n${song.title}\n\n${song.lyrics} \n\n `)
  const copyLyrics = async () => {
    await copyToClipboard(`${song.num} ${song.language == 'ht' ? 'Creole' : 'français'} - ${cateName}\n\n${song.title}\n\n${song.lyrics}\n\n`)
    updateAlertMessage('Copié')
    toggleFlashAlerts(true)
  }

  const handleAddLikes = async () => {
    setLoadingLike(true)
    try {
      const res = await http.put(`/songs/${song.id}/add-likes`);
      if (res.data.ok) {
        song.likes = song.likes + 1 // animate heart after like
        setRefreshPage(!refreshPage); // TODO :: mutate the state to refresh the page
      }
    } catch (error) {
      if (error.response) {
        updateAlertColor('bg-red-500')
        updateAlertMessage('erreur lors de la tentative de ajouter un like')
        toggleFlashAlerts(true)
        console.log(error.response.data.message);
      }
    } finally {
      setLoadingLike(false)
    }
  };

  const handleAddToFavorite = async () => {
    setLoadingFavorite(true)
    if (userFavouriteSong.data.data !== null) {
      try {
        const res = await http.delete(`/favorites-songs/${userFavouriteSong?.data?.data?.id}`, {
          headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + token },
        });
        userFavouriteSong.refetch() // TODO ::  mutate the state to refresh the page
      } catch (error) {
        if (error.response) {
          updateAlertColor('bg-red-500')
          updateAlertMessage('erreur lors de la tentative de suppression d\'un favori') // TODO ::  show message from the backend 
          toggleFlashAlerts(true)
          console.log('Error : ', error.response.data) // handle the error with alert
        }
      } finally {
        setLoadingFavorite(false)
      }
    } else {
      try {
        const res = await http.post(`/favorites-songs`, {
          UserId: user.id,
          SongId: song.id,
        }, {
          headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + token },
        });
        userFavouriteSong.refetch();
      } catch (error) {
        if (error.response) {
          updateAlertColor('bg-red-500')
          updateAlertMessage('erreur lors de la tentative de suppression d\'un favori')
          toggleFlashAlerts(true)
          console.log('Error : ', error.response.data);
        }
      } finally {
        setLoadingFavorite(false)
      }
    }
  };
  return (
    <View className='flex-1 '>
      <StatusBar style='light' />
      {(!!token) && (
        <Pressable
          style={{
            borderRadius: 50,
          }}
          className='absolute  z-10 bg-black/20 p-1 flex text-center items-center justify-center bottom-8 right-4 rounded-full w-12 h-12'
        >
          {
            loadingFavorite ? <Loading /> : (
              <Icon
                name='bookmark'
                extraclass='relative top-0 left-0 z-0'
                onPress={() => handleAddToFavorite()}
                size={30}
                color={userFavouriteSong?.data?.data !== null ? PrimaryColor : 'white'}
              />
            )
          }
        </Pressable>
      )}
      <View className=' items-center  flex flex-row justify-between pt-3 pb-[2px] gap-[2px] px-4'>
        <BoxIconWithText
          //  text='Partager'
          action={() => shareSong()} >
          <EvilIcons name='share-google' size={35} color='black' />
        </BoxIconWithText>
        {song.video?.length > 0 && (
          <BoxIconWithText
            // text='YouTube'
            action={() => Linking.openURL(song.video)} // TODO ::  open youtube video inside the app
          >
            <SimpleLineIcons
              name='social-youtube'
              size={30}
              style={{ color: 'black' }}
            />
          </BoxIconWithText>
        )}
        <BoxIconWithText
          text={`${song?.likes || 0}`} // format like number when > 1000,10k,100k,1M
          action={handleAddLikes}
          loading={loadingLike}
        >
          <EvilIcons
            name='heart'
            size={30}
            color='black'
          />
        </BoxIconWithText>
        <BoxIconWithText
          // text='Copier'
          action={async () => copyLyrics()}
        >
          <Ionicons
            name='md-copy-outline'
            size={20}
            color='black'
          />
        </BoxIconWithText>
        <BoxIconWithText
          // text='Size'
          action={() => setFontSize(!fontSize)}
        >
          <MaterialCommunityIcons
            name={`format-letter-case${!fontSize ? '-lower' : '-upper'}`}
            size={25}
            color='black'
          />
        </BoxIconWithText>
      </View>
      <ScrollView className=' relative ' refreshControl={
        <RefreshControl refreshing={loadingSong} onRefresh={refetchSong} />
      } >
        <View className='mx-3 mb-16 p-4 relative z-30'>
          <Text
            style={{ fontSize: fontSize ? (Platform.OS === 'ios' ? 18 : 20) : Platform.OS === 'ios' ? 13 : 15, }}
            className='text-center text-sm '
          >
            {song.lyrics}
          </Text>

          {/* {isError && <ErrorApp error={error} />} */}
          {/* <RenderHTML
            contentWidth={windowWidth}
            source={{
              html: song.lyricsHtml,
            }}
            tagsStyles={tagsStyles as never}
          /> */}
        </View>
      </ScrollView>
      {showAlert && (<ShowAlert text={alertMessage} color={alertColor} />)}
    </View>
  );
};

export default Song;
