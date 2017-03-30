const isBalanced = function(root) {
  return isBalancedHelper(root)? true : false;
};

const isBalancedHelper = function(root) {
  if (root === null) {
    return 1;
  }

  const leftHeight = isBalancedHelper(root.left);
  if (leftHeight === false) {
    return false;
  }
  const rightHeight = isBalancedHelper(root.right);
  if (rightHeight === false) {
    return false;
  }

  const diff = Math.abs(leftHeight - rightHeight);
  if (diff > 1) {
    return false;
  }
  return Math.max(leftHeight, rightHeight) + 1;
};
