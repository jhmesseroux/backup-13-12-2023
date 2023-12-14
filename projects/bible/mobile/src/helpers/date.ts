export const timeSince = (date: string) => {
  const baseDate = new Date(date);

  const seconds = Math.floor((new Date().getTime() - baseDate.getTime()) / 1000);

  let interval = seconds / 31536000;

  if (interval > 1) {
    return Math.floor(interval) + ' a';
  }
  interval = seconds / 2592000;
  if (interval > 1) {
    return Math.floor(interval) + ' m';
  }
  interval = seconds / 86400;
  if (interval > 1) {
    return Math.floor(interval) + ' j';
  }
  interval = seconds / 3600;
  if (interval > 1) {
    return Math.floor(interval) + ' h';
  }
  interval = seconds / 60;
  if (interval > 1) {
    return Math.floor(interval) + ' min';
  }
  return Math.floor(seconds) + ' sec';
};
