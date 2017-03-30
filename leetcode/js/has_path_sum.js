const hasPathSum = function(root, sum) {
  if (!root) {
    return false;
  }
  if (!root.left && !root.right) {
    return (root.val === sum);
  }
  const sub = sum - root.val;
  return hasPathSum(root.left, sub) || hasPathSum(root.right, sub);
};
