const search = function(arr, target) {
  if (arr.length <= 0) return -1;
  const mid = Math.floor(arr.length / 2);
  //found target
  if (target === arr[mid]) {
    return mid;
  } else {
    //find which section is ordered correctly, use taht side to determine which side to search
    console.log(mid, arr);
    if (arr[mid] > arr[0]) {
      //if true, then left side is ordered correctly
      if (arr[mid] > target && target >= arr[0]) {
        return search(arr.slice(0, mid), target);
      } else {
         const sub = search(arr.slice(mid + 1, arr.length), target);
         return sub === -1 ? -1 : sub + mid + 1;
      }
    } else {
      //right side is ordered correctly
      if (target > arr[mid] && target <= arr[arr.length - 1]) {
        const sub = search(arr.slice(mid + 1, arr.length), target);
        return sub === -1 ? -1 : sub + mid + 1;
      } else {
        return search(arr.slice(0, mid), target);
      }
    }
  }

};

console.log(search([1,3], 1));
