# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('button').preventDefault
    $ ->
      $('button').click ->
        console.log($("input[postid|='" + $(this).attr('id') + "']").val())
        comment = $("input[postid|='" + $(this).attr('id') + "']").val()
        post_url = '/posts/' + $(this).attr('id') + '/comments'
        $.post post_url, { comment: { text: comment }}, (response) ->
          $('comments').append('<div class="well"><strong>@' + response.username + '</strong> – ' + response.comment + '</div>')
          $('input').val('')
    $ ->
      $('a.heart').click (event) ->
        event.preventDefault()
        comment_id = $(this)[0].id
        post_id = $(this).parent().parent()[0].id
        heart = $("input[postid|='" + $(this).attr('id') + "']").val()
        post_url = '/posts/' + post_id + '/comments/' + comment_id + '/hearts'
        $.post post_url, { heart: 1 }, (response) ->
            console.log(response.number_hearts)
            $('span#heart_count' + comment_id).text(response.number_hearts)
    