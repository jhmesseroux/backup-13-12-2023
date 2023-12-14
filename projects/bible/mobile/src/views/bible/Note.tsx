import { StackScreenProps } from '@react-navigation/stack'
import { useEffect, useState, useContext } from 'react';
import { Pressable, Text, ScrollView, View } from 'react-native'
import { PrimaryColor, brandColor } from '../../helpers/variable';
import Icon from '../../components/icons/Icon';
import Loading from '../../components/Loading';
import { cleanHTML } from '../../helpers/text';
import CustomInput from '../../components/CustomInput';
import { AuthContext } from '../../context/auth/AuthContext';
import { http } from '../../api/api';
import ShowAlert from '../../components/general/ShowAlert';
import { formatNumeration } from '../../helpers/general';
import { StatusBar } from 'expo-status-bar';

interface Props extends StackScreenProps<any, 'Note'> { }

const Note = ({ navigation, route }: Props) => {
    // console.log('params :: ', route.params)
    const { data } = route.params
    const { token, showAlert, toggleFlashAlerts, updateAlertMessage, alertMessage, updateAlertColor, alertColor } = useContext(AuthContext);

    // TODO ::  NOTE FUNCTIONALITY TO BE IMPLEMENTED
    const [loadingSavingNote, setLoadingSavingNote] = useState(false)
    useEffect(() => {
        navigation.setOptions({
            headerShown: true,
            title: 'Note',
            headerTitleStyle: {
                // color: 'black',
            },
            headerStyle: {
                // backgroundColor: '',
                borderBottomColor: '#e5e5e5',
                borderBottomWidth: 1,
            },
            headerLeft: (props) => (
                <Icon
                    name='chevron-back-outline'
                    color={brandColor}
                    {...props}
                    onPress={() => navigation.goBack()}
                />
            ),
            headerRight: (props) => (
                <Pressable
                    className='flex items-center justify-center bg-gray-300 rounded-full overflow-hidden h-[35px] p-2 mr-2'
                    onPress={() => handleSaveNote()}
                >
                    {
                        loadingSavingNote ? (
                            <Loading bg='' />
                        ) : (
                            <Text className='uppercase text-sm text-slate-800 font-medium'>
                                Sauvegarder
                            </Text>
                        )
                    }

                </Pressable>
            ),
        });
        return () => { };
    }, []);

    const handleSaveNote = async () => {
        setLoadingSavingNote(true)
        if (data.id !== undefined) {

            try {
                const res = await http.patch(`/bible/favourites/${data.id}`, data, { headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + token } });
                if (res.data.ok) {
                    updateAlertMessage('Note sauvegardé avec succès');
                    // toggleFlashAlerts(true);
                    navigation.push('NoteDetails', { note: data });
                }
            } catch (error) {
                if (error.response) {
                    console.log('Error : ', error.response.data);
                    updateAlertColor('bg-red-500');
                    updateAlertMessage(error.response.data.message || 'Une erreur est survenue. Veuillez réessayer');
                    toggleFlashAlerts(true);
                    console.log('.......................................................................................')
                }
            } finally {
                setLoadingSavingNote(false)
            }
        }
        else {

            try {
                const res = await http.post(`/bible/favourites`, data, { headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + token } });
                if (res.data.ok) {
                    updateAlertMessage('Note sauvegardé avec succès');
                    toggleFlashAlerts(true);
                    navigation.goBack();
                }
            } catch (error) {
                if (error.response) {
                    console.log('Error : ', error.response.data);
                    updateAlertColor('bg-red-500');
                    updateAlertMessage(error.response.data.message || 'Une erreur est survenue. Veuillez réessayer');
                    toggleFlashAlerts(true);
                    console.log('.......................................................................................')
                }
            } finally {
                setLoadingSavingNote(false)
            }
        }

    }

    return (
        <>
            <StatusBar style='auto' />

            <ScrollView className='flex-1 mx-3 ' showsVerticalScrollIndicator={false} >
                <View className='flex  mt-3 p-2 gap-x-1 bg-white rounded-md mb-4 ' >
                    <Text className='text-sm text-brand2 font-medium  mb-1' >
                        {data.bookName} {data.chapter}:{formatNumeration(data.verses)} {data.version.name}
                    </Text>

                    {data.texts.map((v, index) => (
                        <Text
                            key={v.verse}
                            className='w-full'
                        >
                            <Text className='text-xs'> {v.verse} </Text>
                            <Text>{cleanHTML(v.text)}</Text>
                        </Text>
                    ))}
                </View>
                {loadingSavingNote && <Loading bg='' />}
                <View className='pb-12'>
                    <CustomInput
                        name='note'
                        label='Note'
                        placeholder={data.note || "Qu'aimerais-tu dire?"}
                        initialValue={data.note || ''}
                        className='!text-red-800'
                        CStyles={{ fontSize: 17, padding: 10, minHeight: 50 }}
                        multiline={true}
                        onChange={(value) => { data.note = value }}
                    />
                </View>
            </ScrollView>
            {showAlert && <ShowAlert text={alertMessage} color={alertColor} />}

        </>
    )
}

export default Note