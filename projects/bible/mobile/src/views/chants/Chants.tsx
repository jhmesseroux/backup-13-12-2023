import React, { useEffect } from 'react';
import { ScrollView, View } from 'react-native';
import Category from '../../components/chants/Category';
import { useChantCategories } from '../../hooks/useChantCategories';
import { StackScreenProps } from '@react-navigation/stack';
import { brandColor } from '../../helpers/variable';
interface Props extends StackScreenProps<any, 'Chants'> { }

const Chants = ({ navigation }: Props) => {

  const chantCategories = useChantCategories();

  useEffect(() => {
    navigation.setOptions({
      headerShown: true,
      title: 'Chant D\' espérance',
      headerTitleAlign: 'center',
      headerTitleStyle: {
        color: 'white',
      },
      headerStyle: {
        backgroundColor: brandColor,
      }
    });
    return () => { };
  }, []);

  return (
    <ScrollView showsVerticalScrollIndicator={false} style={{ flex: 1, }}>
      <View className="mx-3" style={{ paddingTop: 20, paddingBottom: 40, }} >
        {chantCategories?.map((cate) => (<Category key={cate.id} cate={cate} />))}
      </View>
    </ScrollView>
  );
};

export default Chants;
