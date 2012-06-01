/* Uncompressed JavaScript */
// usage: log('inside coolFunc', this, arguments);
// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = function f() {
  log.history = log.history || [];
  log.history.push(arguments);

  if (this.console) {
    var args = arguments, newarr;
    try {
      args.callee = f.caller;
    } catch (e) {}

    newarr = [].slice.call(args);

    if (typeof console.log === 'object') {
      log.apply.call(console.log, console, newarr);
    } else console.log.apply(console, newarr);
  }
};

// make it safe to use console.log always
(function(a) {
  function b() {}
  for (var c = 'assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn'.split(','), d;
       !!(d = c.pop());) {
         a[d] = a[d] || b;
       }
});

(function() {
  try {
    console.log();
    return window.console;
  } catch (a) {
    return (window.console = {});
  }
}());

(function($) {
  $.fn.blink = function(options) {
    var defaults = { delay: 500 };
    var options = $.extend(defaults, options);

    return this.each(function()
                     {
                       var obj = $(this);
                       setInterval(function()
                                   {
                                     if ($(obj).css('visibility') == 'visible')
                                       {
                                         $(obj).css('visibility', 'hidden');
                                       }
                                       else
                                         {
                                           $(obj).css('visibility', 'visible');
                                         }
                                   }, options.delay);
                     });
  }
  $.fn.stopBlink = function() {
    return this.each(function() {
      var obj = $(this);
      $(obj).css('visibility', 'visible');
    });
  }
}(jQuery));




