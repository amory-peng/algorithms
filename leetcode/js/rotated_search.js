const search = function(arr, target) {
  if (arr.length <= 0) return -1;
  const mid = arr.length / 2;
  //found target
  if (target === arr[mid]) {
    return mid;
  } else {
    //find which section is ordered correctly
    if (arr[mid] > arr[0]) {
      //if true, then left side is ordered correctly
      if (arr[mid] > target && target > arr[0]) {
        search(arr.slice(0, mid), target)
      }
    }
  }

};
