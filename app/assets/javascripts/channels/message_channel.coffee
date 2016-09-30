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
    div = $('<div>')
    message_div = $('<div>', {class: 'message'})
    author_span = $('<span>', {class: 'author', text: author})
    content_span = $('<span>', {class: 'content', text: message.content})
    div.append(message_div)
    message_div.append(author_span, content_span)
    div
