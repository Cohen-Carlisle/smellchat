App.message_channel = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#edwin-container').prepend(this.render_message(data))

  update: ->
    @perform 'update'

  render_message: (message) ->
    author = (message.author || 'Anonymous') + ' ' # space formats it like erb
    $('<div>').append(
      $('<div>', {class: 'message'}).append(
        $('<span>', {class: 'author',  text: author}),
        $('<span>', {class: 'content', text: message.content})
      )
    )
