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
        # $.ajax({
        #   type: "POST",
        #   url: post_url,
        #   data: { comment: { text: comment }},
        #   success: (data) ->
        #     console.log(data.comment)
        #     console.log(data)
        #     return false
        # })

