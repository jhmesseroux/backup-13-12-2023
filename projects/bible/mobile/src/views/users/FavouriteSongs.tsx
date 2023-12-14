import { View, Text, RefreshControl } from 'react-native';
import React, { useEffect, useContext, useState } from 'react';
import { AuthContext } from '../../context/auth/AuthContext';
import { ScrollView, TouchableOpacity } from 'react-native-gesture-handler';
import Icon from '../../components/icons/Icon';
import { useFavouriteSongs } from '../../hooks/useFavouriteSongs';
import Loading from '../../components/Loading';
import Error from '../../components/general/Error';
import { http } from '../../api/api';
import FaveSong from '../../components/users/FaveSong';
import ShowAlert from '../../components/general/ShowAlert';

const FavouriteSongs = ({ navigation }) => {
  const { token, updateAlertColor, updateAlertMessage, toggleFlashAlerts, showAlert, alertColor, alertMessage } = useContext(AuthContext);
  const { data, isError, isLoading, error, isFetching, refetch } = useFavouriteSongs();
  const [isDeleting, setIsDeleting] = useState(false)

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Chansons Préférées',
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: '#A31ACB',
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

  const removeFavourite = async (id) => {

    setIsDeleting(true)

    try {
      await http.delete(`/favorites-songs/${id}`, { headers: { Authorization: 'Bearer ' + token, }, });
      updateAlertMessage('Chanson supprimée avec succès');
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

  if (isError) return <Error text={"Quelque chose de mal s'est produit, veuillez réessayer"} />;
  if (isLoading) return <Loading />;

  return (
    <>
      <ScrollView
        showsVerticalScrollIndicator={false}
        className='mx-3  flex-1 '
        refreshControl={
          <RefreshControl
            refreshing={isFetching}
            onRefresh={refetch}
          />
        }
      >
        <View className='mt-6 mb-6'>
          {data?.data.length > 0 ? (
            data?.data.map((fave) => (
              <FaveSong
                key={fave.id}
                fave={fave}
                isDeleting={isDeleting}
                deleteFave={() => removeFavourite(fave.id)}
                navigation={navigation}
              />
            ))
          ) : (
            <View className='text-center flex items-center flex-1'>
              <Text className='text-lg text-slate-700 mb-4'>Tu n'as pas de chanson préférée </Text>
              <TouchableOpacity
                onPress={() => navigation.navigate('Chants')}
                className='text-center border border-gray-200 p-2 rounded-md'
              >
                <Text className='text-lg font-bold text-center text-blue-600'>Ajoutez-en un maintenant</Text>
              </TouchableOpacity>
            </View>
          )}
        </View>
        {isFetching && <Loading />}
      </ScrollView>
      {showAlert && (<ShowAlert text={alertMessage} color={alertColor} />)}
    </>

  );
};

export default FavouriteSongs;
