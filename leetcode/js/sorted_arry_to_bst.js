class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

function sortedArrayToBst(nums) {
  if (nums.length === 0) {
    return null;
  }
  const mid = nums.length / 2;
  const root = new TreeNode(nums[mid]);
  root.left = sortedArrayToBst(nums.slice(0, mid));
  root.right = sortedArrayToBst(nums.slice(mid+1));
  return root;
}
