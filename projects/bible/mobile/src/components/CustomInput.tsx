import {
  KeyboardTypeOptions,
  StyleSheet,
  Text,
  TextInput,
  View,
} from "react-native";
import React, { useState } from "react";

type Props = {
  placeholder: string;
  kbType?: KeyboardTypeOptions;
  onChange: (val: string, label: string) => void;
  label?: string;
  secure?: boolean;
  className?: string;
  CStyles?: any;
  initialValue?: string;
  name: string;
  error?: string;
  optional?: boolean;
  multiline?: boolean;
};

const CustomInput = ({
  initialValue = "",
  placeholder,
  kbType = "default",
  onChange,
  label,
  secure = false,
  className = "",
  CStyles = null,
  optional = false,
  name,
  error = '',
  multiline = false
}: Props) => {
  const [value, setValue] = useState<string>(initialValue);


  return (
    <View style={styles.box}>
      {label?.length > 0 && (
        <View className="flex flex-row items-center">
          <Text className="text-slate-800 font-bold dark:text-slate-700">
            {label}
          </Text>
          {optional && (
            <Text className="text-xs text-gray-500 dark:text-slate-700">
              (optionnel)
            </Text>
          )}
        </View>
      )}
      <TextInput
        style={{ ...styles.input, ...CStyles }}
        onChangeText={(value) => {
          setValue(value);
          onChange(value, name);
        }}
        className={`bg-white dark:bg-slate-900 ${className} text-gray-600 dark:text-slate-600`}
        secureTextEntry={secure}
        value={value}
        multiline={multiline}
        placeholder={placeholder}
        keyboardType={kbType}
      />
      {error.length > 0 && <Text style={{ color: "#FF6969" }}>{error}</Text>}
    </View>
  );
};

export default CustomInput;

const styles = StyleSheet.create({
  input: {
    // minHeight: 50,
    borderRadius: 5,
    // padding: 10,
    width: "100%",
    border: "none",
    outline: "none",
    // marginVertical: 8,
  },
  box: {
    width: "100%",
  },
});
