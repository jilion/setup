javascript:(function(){
  var scripts = document.getElementsByTagName('script');
  var loader  = null;
  for(var i=0; i < scripts.length; i++) {
    if (/cdn\.sublimevideo\.net\/js\/[a-z0-9]{8}\.js/.test(scripts[i].src)) {
      if (!loader) loader = scripts[i].src.replace(/\/js\//, '/l/');
      else alert("Multiple loaders found!");
    }
  };
  if (loader) window.open(loader);
  else alert("No SublimeVideo loader found!");
})();