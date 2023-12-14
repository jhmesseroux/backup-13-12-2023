import {
  View,
  Text,
  RefreshControl,
  useWindowDimensions,
  Modal,
  Pressable,
} from "react-native";
import React, {
  useEffect,
  useContext,
  useState,
  useCallback,
  useMemo,
  useRef,
} from "react";
import { AuthContext } from "../../context/auth/AuthContext";
import { ScrollView, TouchableOpacity } from "react-native-gesture-handler";
import Icon from "../../components/icons/Icon";
import { useFavouriteVerses } from "../../hooks/useFavouriteVerses";
import Loading from "../../components/Loading";
import Error from "../../components/general/Error";
import { http } from "../../api/api";
import { PrimaryColor, brandColor, brandColor2 } from "../../helpers/variable";
import FaveHighlight from "../../components/users/FaveHighlight";
import { TYPE } from "../../helpers/enums";
import ShowAlert from "../../components/general/ShowAlert";
import { LinearGradient } from "expo-linear-gradient";
import NoteItem from "../../components/users/NoteItem";
import { useVersesOfTheDays } from "../../hooks/useVersesOfTheDays";
import VerseOfTheDay from "../../components/VerseOfTheDay";
import BottomSheet, {
  BottomSheetModal,
  BottomSheetModalProvider,
} from "@gorhom/bottom-sheet";
import { IVotd } from "../../interfaces/bibles/VerseOgTheDay";
import shareComponent from "../../helpers/shareComponent";
import { cleanHTML, copyToClipboard } from "../../helpers/text";
import { formatNumeration } from "../../helpers/general";
import { StackScreenProps } from "@react-navigation/stack";
import { BibleContext } from "../../context/bible/bibleContext";
interface Props extends StackScreenProps<any, 'VersesOfThedays'> { }

const VersesOfTheDays = ({ navigation }: Props) => {
  const {
    token,
    updateAlertColor,
    updateAlertMessage,
    toggleFlashAlerts,
    showAlert,
    alertColor,
    alertMessage,
  } = useContext(AuthContext);
  const { updateBook, updateChapter } = useContext(BibleContext);

  const { data, isError, isLoading, error, isFetching, refetch } =
    useVersesOfTheDays();
  const [isDeleting, setIsDeleting] = useState(false);
  const [modalActive, setModalActive] = useState(false);
  const [currentVotd, setCurrentVotd] = useState<IVotd>();
  const { height } = useWindowDimensions();

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: "Verset du jour",
      headerTitleStyle: {
        color: "white",
      },
      headerStyle: {
        backgroundColor: brandColor,
      },
      headerLeft: (props) => (
        <Icon
          name="chevron-back-outline"
          color="white"
          {...props}
          onPress={() => navigation.goBack()}
        />
      ),
    });
    return () => { };
  }, []);


  const handleToogleModal = (p) => {
    setCurrentVotd(p);
    setModalActive((prev) => !prev);
  };
  if (isError)
    return (
      <Error
        text={
          // @ts-ignore
          error?.response?.data?.message ||
          "Quelque chose de mal s'est produit, veuillez réessayer"
        }
      />
    );
  if (isLoading) return <Loading />;

  return (
    <>
      <ScrollView
        showsVerticalScrollIndicator={false}
        className="flex-1 "
        refreshControl={
          <RefreshControl refreshing={isFetching} onRefresh={refetch} />
        }
      >
        <View className="mt-6 mx-2 ">
          {data?.data?.data?.length > 0 ? (
            data?.data?.data?.map((votd) => (
              <VerseOfTheDay
                key={votd.id}
                votd={votd}
                onPressMore={(p) => handleToogleModal(p)}

              // note={note}
              // navigation={navigation}
              />
            ))
          ) : (
            <View
              style={{ height: height - 150 }}
              className="text-center   justify-center items-center "
            >
              <Text className="text-lg text-slate-700 mb-4">
                Tu n'as pas de notes{" "}
              </Text>
              <LinearGradient
                colors={[brandColor, brandColor2]}
                // put the gradient left to right
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 0 }}
                className="w-full shadow-md rounded-md m-0"
              >
                <TouchableOpacity
                  onPress={() => navigation.navigate("Bible")}
                  className="text-center border border-gray-200 p-2 rounded-md"
                >
                  <Text className="text-lg font-bold text-center text-white">
                    Lire la bible
                  </Text>
                </TouchableOpacity>
              </LinearGradient>
            </View>
          )}
        </View>
        {isFetching && <Loading />}


        <Modal
          visible={modalActive}
          className="bg-transparent"
          transparent={true}
          animationType="slide"
          style={{ backgroundColor: "red" }}

        // presentationStyle='overFullScreen'
        >
          <View className="flex-1 bg-black/30 justify-end">
            <View className="mx-3 my-0 p-0 shadow rounded-md bg-white overflow-hidden">
              <Pressable
                onPress={() => {
                  setModalActive(false);
                  setCurrentVotd(null);
                  updateBook({
                    book_number: currentVotd.bookNumber,
                    long_name: currentVotd.bookName,
                    chapters: null,
                    short_name: null,
                    verses: null
                  })
                  updateChapter(currentVotd.chapter)
                  navigation.navigate("Bible", {
                    bookNumber: currentVotd.bookNumber,
                    chapter: currentVotd.chapter,
                  });
                }}
                className="p-2  flex-row items-center  text-lg font-semibold shadow"
              >
                <View className="w-12 h-12 rounded-full shadow-md items-center justify-center bg-gray-100 ">
                  <Icon name="book-outline" color="#0b151a" />
                </View>
                <Text className="text-lg font-medium text-slate-600 ml-3">
                  Lire
                </Text>
              </Pressable>
              <Pressable
                onPress={() => {
                  setModalActive(false);
                  copyToClipboard(`${currentVotd.texts.map(v => cleanHTML(v.text)).join('')} \n${currentVotd.bookName} ${currentVotd.chapter}:${formatNumeration(currentVotd.verses)} ${currentVotd.version.name}`)
                }}
                className="p-2  flex-row items-center  text-lg font-semibold shadow"
              >
                <View className="w-12 h-12 rounded-full shadow-md items-center justify-center bg-gray-100 ">
                  <Icon name="md-copy-outline" color="#0b151a" />
                </View>
                <Text className="text-lg font-medium text-slate-600 ml-3">
                  Copier
                </Text>
              </Pressable>
              <Pressable
                onPress={() => {
                  setModalActive(false);
                  shareComponent(`${currentVotd.texts.map(v => cleanHTML(v.text)).join('')} \n${currentVotd.bookName} ${currentVotd.chapter}:${formatNumeration(currentVotd.verses)} ${currentVotd.version.name}`)
                }}
                className="p-2  flex-row items-center  text-lg font-semibold shadow"
              >
                <View className="w-12 h-12 rounded-full shadow-md items-center justify-center bg-gray-100 ">
                  <Icon name="share-outline" color="#0b151a" />
                </View>
                <Text className="text-lg font-medium text-slate-600 ml-3">
                  Patager
                </Text>
              </Pressable>
            </View>
            <Pressable
              onPress={() => setModalActive(false)}
              className="p-2  flex-row items-center bg-white mx-3 rounded-md my-3 text-lg font-semibold shadow"
            >
              <View className="w-12 h-12 rounded-full shadow-md items-center justify-center bg-gray-100 ">
                <Icon name="close" color="#0b151a" />
              </View>
              <Text className="text-lg font-medium text-slate-600 ml-3">
                Fermer
              </Text>
            </Pressable>
          </View>
        </Modal>
      </ScrollView>
      {showAlert && <ShowAlert text={alertMessage} color={alertColor} />}
    </>
  );
};

export default VersesOfTheDays;
