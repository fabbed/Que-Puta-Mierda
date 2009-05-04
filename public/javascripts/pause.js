 /*
 * [ 0.2 ] Original by Jonathan Howard
 * [ 0.3 ] Updated for current jQuery releases,
 *         and formatted for jQuery namespace by Charles Phillips
 *         <charles@doublerebel.com> | http://www.doublerebel.com/scripts/jquery.pause.js
 *
 * jQuery Pause
 * version 0.3
 *
 */
 
(function($) {
  $.fn.extend({
    pause: function(milli,type) {
      milli = milli || 1000;
      type = type || "fx";
      return this.queue(type,function(){
        var self = this;
        setTimeout(function(){
          $(self).dequeue();
        },milli);
      });
    },
    clearQueue: function(type) {
      return this.each(function(){
        type = type || "fx";
        if(this.queue && this.queue[type]) {
          this.queue[type].length = 0;
        }
      });
    },
    unpause: $.fn.clearQueue
  });
})(jQuery);
