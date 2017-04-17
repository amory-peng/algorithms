const debounce = function(func, wait) {
  let timeout = null;
  let args = null;
  let context = this;
  const later = () => func.apply(context, arguments);
  return function() {
    args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
};
