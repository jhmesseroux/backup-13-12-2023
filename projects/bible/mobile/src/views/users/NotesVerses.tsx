import { View, Text, RefreshControl, useWindowDimensions } from 'react-native';
import React, { useEffect, useContext, useState } from 'react';
import { AuthContext } from '../../context/auth/AuthContext';
import { ScrollView, TouchableOpacity } from 'react-native-gesture-handler';
import Icon from '../../components/icons/Icon';
import { useFavouriteVerses } from '../../hooks/useFavouriteVerses';
import Loading from '../../components/Loading';
import Error from '../../components/general/Error';
import { http } from '../../api/api';
import { PrimaryColor, brandColor, brandColor2 } from '../../helpers/variable';
import FaveHighlight from '../../components/users/FaveHighlight';
import { TYPE } from '../../helpers/enums';
import ShowAlert from '../../components/general/ShowAlert';
import { LinearGradient } from 'expo-linear-gradient';
import NoteItem from '../../components/users/NoteItem';

const NotesVerses = ({ navigation }) => {
  const { token, updateAlertColor, updateAlertMessage, toggleFlashAlerts, showAlert, alertColor, alertMessage } = useContext(AuthContext);
  const { data, isError, isLoading, error, isFetching, refetch } = useFavouriteVerses(TYPE.NOTE);
  const [isDeleting, setIsDeleting] = useState(false)
  const { height } = useWindowDimensions()

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Notes',
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: brandColor2,
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
  }, []);

  const removeHighlight = async (id) => {
    setIsDeleting(true)
    try {
      await http.delete(`/bible/favourites/${id}`, { headers: { Authorization: 'Bearer ' + token, }, });
      updateAlertMessage('Note supprimée avec succès');
      toggleFlashAlerts(true)
      refetch();
    } catch (error) {
      if (error.response) {
        updateAlertColor('bg-red-400')
        updateAlertMessage(error.response.data.message || "Quelque chose de mal s'est produit, veuillez réessayer");
        toggleFlashAlerts(true)
        // console.log(error.response.data);
      }
    } finally { setIsDeleting(false) }
  };


  if (isError)
    // @ts-ignore
    return <Error text={error?.response.data?.message || "Quelque chose de mal s'est produit, veuillez réessayer"} />;
  if (isLoading) return <Loading />;

  return (
    <>
      <ScrollView
        showsVerticalScrollIndicator={false}
        className='flex-1 '
        refreshControl={
          <RefreshControl
            refreshing={isFetching}
            onRefresh={refetch}
          />
        }
      >
        <View className='mb-6'>
          {data?.data.length > 0 ? (
            data?.data.map((note) => (
              <NoteItem
                isDeleting={isDeleting}
                key={note.id}
                note={note}
                deleteNote={() => removeHighlight(note.id)}
                navigation={navigation}
              />
            )
            )
          ) : (
            <View
              style={{ height: height - 150 }}
              className='text-center   justify-center items-center '>
              <Text className='text-lg text-slate-700 mb-4'>Tu n'as pas de notes </Text>
              <LinearGradient
                colors={[brandColor, brandColor2]}
                // put the gradient left to right 
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 0 }}
                className='w-full shadow-md rounded-md m-0'>

                <TouchableOpacity
                  onPress={() => navigation.navigate('Bible')}
                  className='text-center border border-gray-200 p-2 rounded-md'
                >
                  <Text className='text-lg font-bold text-center text-white'>Lire la bible</Text>
                </TouchableOpacity>
              </LinearGradient>
            </View>
          )}
        </View>
        {isFetching && <Loading />}
      </ScrollView>
      {showAlert && (<ShowAlert text={alertMessage} color={alertColor} />)}
    </>

  );
};

export default NotesVerses;
