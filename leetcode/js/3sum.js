const threeSum = function(nums) {
  const out = [];
  const seen = new Set();
  for (let i = 1; i < nums.length - 1; i++) {
    for (let j = i + 1; j < nums.length; j++) {
      if (seen.has(-(nums[i] + nums[j]))){
        out.push([nums[i], nums[j], -(nums[i] + nums[j])]);
      } else {
        seen.add(nums[i]);
      }
    }
  }
  return out;
};
