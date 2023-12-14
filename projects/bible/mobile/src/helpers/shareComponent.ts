import { Share } from "react-native";

const shareComponent = async (message: string) => {
  try {
    const result = await Share.share({ message })

    if (result.action === Share.sharedAction) {
      if (result.activityType) {
        // shared with activity type of result.activityType
      } else {
        // shared
      }
    } else if (result.action === Share.dismissedAction) {
      // dismissed
    }
  } catch (error: any) {
    console.log(error.message);
  }
};


export default shareComponent;