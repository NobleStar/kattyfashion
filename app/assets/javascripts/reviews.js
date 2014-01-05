// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

(function($, undefined) {
    $(document).on('submit', 'form.review.ajax-form', function(e) {
       var form = $(this),
           main_container = form.parents('div.review'),
           thank_you = main_container.find('div.thank-you'),
           data = form.serialize();
       $.post(form.prop('action'), data, function(response) {
           if (response.status) {
               form.hide();
               thank_you.html(response.message).show();
           }
       }, 'json');
       return false;
    });
})(jQuery);