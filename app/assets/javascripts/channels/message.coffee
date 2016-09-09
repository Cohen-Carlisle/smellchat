App.message_channel = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#edwin-container').prepend(this.render_message(data))

  update: ->
    @perform 'update'

  render_message: (message) ->
    '<div>' +
     '<div class="message">' +
       '<span class="author">' +
         (message.author || 'Anonymous') +
         ' ' + # makes it look the same as erb
       '</span>' +
       '<span class="content">' +
         message.content +
       '</span>' +
     '</div>' +
    '</div>'
