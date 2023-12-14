import { useState } from "react";
import { Pressable, StyleSheet, Text, View } from "react-native";

export default function RadioButton({ data, onSelect }) {


  const [userOption, setUserOption] = useState(null);
  const selectHandler = (value) => {
    onSelect(value);
    setUserOption(value);
  };
  return (
    <View>
      {data.map((item) => {
        return (
          <Pressable
            className="flex flex-row items-center  pl-3  "
            onPress={() => selectHandler(item)}>
            <View
              className={`w-6 h-6 rounded-full border border-gray-200 ${item === userOption && 'bg-blue-600'}`}></View>
            <Text className=" text-lg font-semibold text-gray-600 capitalize ml-2 flex-1 border-b p-2  border-gray-100"> {item}</Text>
          </Pressable>
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  option: {
    fontSize: 20,
    color: 'white',
    textAlign: 'center',
  },
  unselected: {
    // backgroundColor: 'red',
    // margin: 5,
  },
  selected: {
    backgroundColor: 'blue'
    // backgroundColor: 'blue',
    // margin: 6,
    // padding: 10,
    // borderRadius: 10,
  },
});