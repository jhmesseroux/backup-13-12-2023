import * as Clipboard from 'expo-clipboard';

export const copyToClipboard = async (data: string) => {
  await Clipboard.setStringAsync(data);
};

export const fetchCopiedText = async () => await Clipboard.getStringAsync();
export const cleanHTML = (text: string) => text.replace(/(<([^>]+)>)/gi, '');

// create a funcion to replace any letter with accent to the same letter without accent
export const removeAccents = (str: string) => {
  return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
}