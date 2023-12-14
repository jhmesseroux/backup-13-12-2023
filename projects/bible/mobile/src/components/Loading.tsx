import { View, ActivityIndicator } from 'react-native'
import { brandColor } from '../helpers/variable';

const Loading = ({ color = brandColor, bg = 'bg-gray-100' }: { color?: string, bg?: string }) => {


  return (
    <View className={`flex-1 items-center justify-center ${bg}`}>
      <ActivityIndicator animating={true} size='large' color={color} />
    </View>
  );
};

export default Loading;
