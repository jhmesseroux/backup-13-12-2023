import { ActivityIndicator, Pressable, Text, TouchableOpacity, View, Image } from "react-native";
import React, { useContext, useState } from "react";
import CustomInput from "../../components/CustomInput";
import useForm from "../../hooks/useForm";
import { appStyle } from "../../theme/appStyle";
import { useNavigation } from "@react-navigation/native";
import { ScrollView } from "react-native-gesture-handler";
import Error from "../../components/general/Error";
import { AuthContext } from "../../context/auth/AuthContext";
import { validateForm } from "../../helpers/form";
import { StatusBar } from "expo-status-bar";
import IconOnly from "../../components/icons/IconOnly";

const Register = () => {

  const navigation = useNavigation();
  const { signUp, errorMessage, removeError } = useContext(AuthContext);
  const [errors, setErrors] = useState<any>({});
  const [loading, setLoading] = useState(false);
  const { email, password, data, onChange, username } = useForm({ username: "", email: "", password: "", });

  const handleLogin = async () => {
    removeError();
    const { error, ok } = validateForm(data);
    setErrors(error);
    if (!ok) return false;
    setLoading(true);
    await signUp(data);
    setLoading(false);
  };

  return (
    <ScrollView className="bg-white">
      <StatusBar />
      <Pressable
        onPress={() => navigation.goBack()}
        className="absolute top-12 z-20 left-6 w-8 h-8 rounded-full shadow border border-gray-200 flex items-center bg-gray-50"
      >
        <IconOnly name="chevron-back-outline" />
      </Pressable>
      <View className="flex-1 items-center  h-screen">
        <View className="w-[95%]">
          <View className="w-full h-64 bg-slate-600 object-cover">
            <Image
              className="p-4 w-full h-full object-cover"
              source={require("./../../assets/signupavatar.jpg")}
            />
          </View>
          <Text className="text-3xl text-blue-600 font-base mb-4 justify-items-start"> S'inscrire</Text>
          <CustomInput
            onChange={onChange}
            CStyles={{ backgroundColor: "#F5F5F5" }}
            label="Nom complet"
            error={errors.username ? "Le nom d'utilisateur est requis" : ""}
            placeholder="Pierre Dupont"
            name="username"
            kbType="name-phone-pad"
          />
          <CustomInput
            onChange={onChange}
            label="Email"
            name="email"
            error={errors.email ? "L'email est requis" : ""}
            CStyles={{ backgroundColor: "#F5F5F5" }}
            kbType="email-address"
            placeholder="example@gmail.com"
          />
          <CustomInput
            label="Mot de passe"
            CStyles={{ backgroundColor: "#F5F5F5" }}
            name="password"
            error={errors.password ? "Le mot de passe est requis" : ""}
            secure={true}
            onChange={onChange}
            placeholder="U7y_Ipk)uhj#j@"
          />
          {errorMessage && <Error text={errorMessage} />}
          <View >
            <TouchableOpacity
              style={{
                ...appStyle.btn,
                backgroundColor: "rgba(0, 124, 209, 1)",
              }}
              activeOpacity={0.7}
              onPress={handleLogin}
            >
              <View className=" flex items-center">
                <Text className="text-center justify-center font-bold text-lg text-white">
                  {loading ? (<ActivityIndicator color="white" />) : ("Creer votre compte")}
                </Text>
              </View>
            </TouchableOpacity>
          </View>

          <View className="flex w-full flex-row gap-2 font-semibold  items-center justify-center">
            <Text className="text-sm ">Déjà un compte ? </Text>
            <Pressable onPress={() => navigation.navigate("Login" as never)}>
              <Text className="text-blue-600 font-medium">S'identifier</Text>
            </Pressable>
          </View>
        </View>
      </View>
    </ScrollView>
  );
};

export default Register;