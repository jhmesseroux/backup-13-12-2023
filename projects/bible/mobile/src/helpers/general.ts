export const getColorBox = (text: string): string => {
  let color: string = '';
  switch (text) {
    case 'CE':
      color = '#016dbe';
      break;
    case 'MJ':
      color = '#f16fa1';
      break;
    case 'EE':
      color = '#111827';
      break;
    case 'VR':
      color = '#74c714';
      break;
    case 'HC':
      color = '#ff9800';
      break;
    case 'RN':
      color = '#00a495';
      break;
    case 'GA':
      color = '#016dbe';
      break;

    default:
      color = '#016dbe';
      break;
  }

  return color;
};

export const validateMail = (mail: string): boolean => {
  return /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(mail);
};

export const dataColors = ['#3c7af58e', '#2DCDDF', '#579BB1', '#F0A04B', '#EA8FEA', '#B5F1CC', '#a485d1', '#f39268b0'];

export const formatNumeration = (numbers) => {

  if (typeof (numbers) === 'string') {
    numbers = numbers.split(',').map((n) => parseInt(n));
  }
  let result = [];
  let start = numbers[0];
  let end = numbers[0];

  for (let i = 1; i < numbers.length; i++) {
    if (numbers[i] === end + 1) {
      end = numbers[i];
    } else {
      result.push(start === end ? start : `${start}-${end}`);
      start = numbers[i];
      end = numbers[i];
    }
  }

  result.push(start === end ? start : `${start}-${end}`);
  return result.join(',');
}