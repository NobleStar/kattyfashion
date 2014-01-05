// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('click', '.review-action', function(e) {
    var $this = $(this),
        run_action = false,
        action = '',
        action_url = '/admin/reviews/',
        review_id = $this.data('review-id'),
        ajax_data = {
            id: review_id
        },
        mainbox = $this.parents('.review-mainbox');
    console.log('here');
    if ($this.hasClass('confirm-on-click')) {
        if (confirm($this.data('confirmation'))) {
            run_action = true;
        }
    }
    else {
        run_action = true;
    }
    if (!run_action) {
        return;
    }

    if ($this.hasClass('delete-review')) {
        action = 'delete';
    }
    if ($this.hasClass('approve-review')) {
        action = 'approve';
    }
    if ($this.hasClass('disapprove-review')) {
        action = 'disapprove';
    }
    if (action == '') {
        alert('Не удалось найти подходящего действия');
        return;
    }

    action_url = action_url  + action + '/';

    $.ajax(action_url,
    {
        data: ajax_data,
        dataType: 'json',
        success: function(response) {
            var appr;
            if (response.status) {
                if (action == 'delete') {
                    $.when(mainbox.animate({opacity: 0, height: 0}, 'fast').remove()).then(function() {
                        $('#review-delete-modal').modal();
                    });
                }
                if (action == 'approve') {
                    mainbox.find('.toggle-approve').toggleClass('hidden');
                    mainbox.find('.review-status').toggleClass('review-approved');
                }
                if (action == 'disapprove') {
                    mainbox.find('.toggle-approve').toggleClass('hidden');
                    mainbox.find('.review-status').toggleClass('review-approved');
                }
            }
        }

    });

});

/*
$(document).on('click', '.confirm-on-click', function(e) {
    var $this = $(this),
        confirm_text = $this.data('confirmation');
    confirm(confirmation_text);
});
*/
