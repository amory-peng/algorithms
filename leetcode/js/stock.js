const stock = function(arr) {
  let min = arr[0];
  let maxDiff = arr[1] - arr[0];
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] - min > maxDiff) {
      maxDiff = arr[i] - min;
    }

    if (arr[i] < min) {
      min = arr[i];
    }
  }
  return maxDiff;
};
