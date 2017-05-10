const removeDuplicates = function(arr) {
  if (arr.length === 0) return 0;
  let j = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] !== arr[j]) {
      j++;
      arr[j] = arr[i];
    }
  }
  return j + 1;
};
