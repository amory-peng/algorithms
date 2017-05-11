const permutations = function(arr) {
  if (arr.length <= 1) return [arr];
  const out = [];
  const first = arr[0];
  const subArrays = permutations(arr.slice(1));
  for (let i = 0; i < subArrays.length; i++) {
    let sub = subArrays[i];
    for (let j = 0; j <= sub.length; j++) {
      out.push(sub.slice(0, j).concat([first]).concat(sub.slice(j, sub.length)));
    }
  }
  return out;
};
