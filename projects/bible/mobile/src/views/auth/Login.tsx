import { Pressable, StyleSheet, Text, TouchableOpacity, ActivityIndicator, Image, View, ScrollView, } from "react-native";
import React, { useContext, useState } from "react";
import { StatusBar } from "expo-status-bar";
import { AuthContext } from "../../context/auth/AuthContext";
import { StackScreenProps } from "@react-navigation/stack";

import Error from "../../components/general/Error";
import CustomInput from "../../components/CustomInput";
import IconOnly from "../../components/icons/IconOnly";
import useForm from "../../hooks/useForm";
import { validateForm } from "../../helpers/form";

interface Props extends StackScreenProps<any, "Home"> { }

const Login = ({ navigation }: Props) => {

  const [loading, setLoading] = useState(false);
  const { signIn, errorMessage, removeError } = useContext(AuthContext);
  const [errors, setErrors] = useState<any>({})
  const { email, password, data, onChange } = useForm({ email: "", password: "", })

  const handleLogin = async () => {
    removeError();
    const { error, ok } = validateForm(data);
    setErrors(error);
    if (!ok) return false;
    setLoading(true);
    await signIn(data);
    setLoading(false);
  };

  return (
    <ScrollView showsVerticalScrollIndicator={false} style={{ flex: 1, backgroundColor: 'white' }} >
      <StatusBar />
      <View className="flex-1 items-center h-screen bg-white">
        <Pressable
          onPress={() => navigation.goBack()}
          className="absolute top-12 z-20 left-6 w-8 h-8 rounded-full shadow border border-gray-200 flex items-center bg-gray-50"
        >
          <IconOnly name="close" />
        </Pressable>
        <View className="w-full h-64  bg-slate-600 object-cover">
          <Image
            className="p-4 w-full h-full object-cover"
            source={require("./../../assets/signinavatar.jpg")}
          />
        </View>
        <View className="w-[95%]  h-screen">
          <Text className="text-3xl text-blue-600 font-base mb-4 justify-items-start">S'identifier</Text>
          <CustomInput
            onChange={onChange}
            CStyles={{ backgroundColor: "#F5F5F5" }}
            kbType="email-address"
            className="!bg-gray-500"
            label="Email"
            name="email"
            error={errors?.email ? "Le mail est obligatoire et doit être valide" : ""}
            placeholder="example@gmail.com"
          />
          <CustomInput
            label="Mot de passe"
            CStyles={{ backgroundColor: "#F5F5F5" }}
            secure={true}
            name="password"
            onChange={onChange}
            error={errors?.password ? "Le mot de passe est requis" : ""}
            placeholder="pvbikmo.dI#lk"
          />
          {!!errorMessage && <Error text={errorMessage} />}
          <View style={styles.box}>
            <TouchableOpacity
              className="bg-blue-600 w-fit p-2 rounded-md shadow-xl"
              activeOpacity={0.7}
              onPress={handleLogin}
            >
              <View className=" flex items-center">
                <Text className="text-center justify-center font-bold text-lg text-white">
                  {loading ? (<ActivityIndicator color="white" />) : ("S'identifier")}
                </Text>
              </View>
            </TouchableOpacity>
          </View>
          {/* <Text>OR</Text> */}
          {/* <View style={styles.box}>
            <TouchableOpacity
              style={{ ...appStyle.btn }}
              className='bg-blue-500'
              activeOpacity={0.7}
              onPress={handleLogin}
            >
              <Text
                className='text-center font-bold text-lg text-white'
              >
                {loading ? <ActivityIndicator color='white' /> : 'S\'identifier avec Google'}
              </Text>
            </TouchableOpacity>
          </View> */}

          <View className="flex w-full flex-row gap-2 font-semibold  items-center justify-center my-3">
            <Text className="text-sm ">Nouveau sur A Tes Pieds Jésus?</Text>
            <Pressable onPress={() => navigation.navigate("Register" as never)}>
              <Text className="text-blue-600 font-medium">S'inscrire</Text>
            </Pressable>
          </View>
          <Pressable
            className="flex w-full flex-row gap-2 font-semibold  items-center justify-center"
            onPress={() => navigation.navigate("ForgotPassword" as never)}
          >
            <Text className="font-normal text-red-700 underline my-2 ">
              Mot de passe oublié?
            </Text>
          </Pressable>
        </View>
      </View>
    </ScrollView>
  );
};

export default Login;

const styles = StyleSheet.create({
  box: {
    width: "100%",
    marginVertical: 5
  },
});
