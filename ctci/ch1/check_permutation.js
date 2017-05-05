function checkPermutation(str1, str2) {
  let set = {};
  for (let i = 0; i < str1.length; i++) {
    set[str1[i]] = set[str1[i]] + 1 || 1;
  }
  for (let i = 0; i < str2.length; i++) {
    if (!set[str2[i]]) {
      return false;
    } else {
      set[str2[i]] -= 1;
      if (set[str2[i]] < 0) return false;
    }

  }
  return true;
}
