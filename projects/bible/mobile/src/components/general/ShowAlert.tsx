import { Text, View } from "react-native";


const ShowAlert = ({ text, color = null }) => {
  return (
    <View style={{ zIndex: 100000 }} className="w-full  items-center justify-center absolute  bottom-8 ">
      <View
        className={`w-[90%] !max-w-fit rounded-full  transition-opacity  duration-1000  flex  shadow  items-center justify-center p-2 h-full ${color ? color : 'bg-black/70'} `}>
        <Text className="text-white text-sm font-base">{text}</Text>
      </View>
    </View>
  )
}


export default ShowAlert;