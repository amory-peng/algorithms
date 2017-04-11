const reverseString = function(str) {
  if (str.length === 0) {
    return "";
  }
  return reverseString(str.slice(1,str.length - 1)) + str[0];
};
