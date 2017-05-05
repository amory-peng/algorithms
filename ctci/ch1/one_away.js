function oneAway(str1, str2) {
  if (Math.abs(str1.length - str2.length) > 1) {
    return false;
  }
  let shorter = str1.length > str2.length ? str2 : str1;
  let longer = str1.length > str2.length? str1 : str2;
  let p1 = 0;
  let p2 = 0;
  let diff = false;
  while (p1 < shorter.length && p2 < longer.length) {
    if (shorter[p1] !== longer[p2]) {
      if (diff) return false;
      diff = true;
      if (shorter.length === longer.length) {
        p1 += 1;
      }
    } else {
      p1 += 1;
    }
    p2 += 1;
  }
  return true;
}
