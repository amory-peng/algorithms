const debounce = function(func, wait) {
  //this lets clearTimeout remove timeout, each call references this timeout;
  let timeout = null;
  let args = null;
  //bind 'this'
  let context = this;

  const later = () => func.apply(context, args);
  return function() {
    args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
};

//debounce with immediate option
const debounce2 = function(cb, wait, immediate) {
  let timeout = null;

  return function() {
    let args = arguments;
    let context = this;
    
    const later = () => {
      timeout = null;
      if (!immediate) cb.apply(context, args);
    };
    let callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) cb.apply(context, args);
  };
};
