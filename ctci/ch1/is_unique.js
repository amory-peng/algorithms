function isUnique(string) {
  let set = {};
  for (let i = 0; i < string.length; i++) {
    if (set[string[i]]) {
      return false;
    }
    set[string[i]] = true;
  }
  return true;
}
