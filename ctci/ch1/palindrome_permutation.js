function palindromePermutation(str) {
  let dict = {};
  for (let i = 0; i < str.length; i++) {
    dict[str[i]] = dict[str[i]] + 1 || 1;
  }
  let flag = false;
  const keys = Object.keys(dict);
  for (let i = 0; i < keys.length; i++) {
    if (dict[i] % 2 !== 0) {
      if (!flag) {
        flag = true;
      } else {
        return false;
      }
    }
  }
  return true;
}

console.log(palindromePermutation("tacocate"));
