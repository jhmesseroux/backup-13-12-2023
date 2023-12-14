import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';


// still-journey-12388.herokuapp
// 192.168.100.5
const host = '192.168.100.3';
// const host = '192.168.100.5';
// const host = '192.168.100.14';

export const http = axios.create({
  baseURL: `http://${host}:8000/api/v1`,
  headers: {
    'Content-type': 'application/json',
    Authorization:
      'Bearer ' + 'i9L&eh%MWTPOuQnpZBayG_8iAXUj=c7Lf5R90tLOxnjAEetKzz62Av!t9==Am8RIKN8tu&=EtzhdQyMExEBmm+E&S5q7MOb&rp',
  },
});
export const httpSecure = async () => {
  const token = await AsyncStorage.getItem('token');
  const api = axios.create({
    baseURL: `http://${host}:8000/api/v1`,
    headers: {
      'Content-type': 'application/json',
      Authorization: 'Bearer ' + token
    },
  });

  return api
}