//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('ChatChannel', {
  received: function(message) {
    return $('#edwin-container').prepend(this.renderMessage(message));
  },

  renderMessage: function(message) {
    return '<div>' +
             '<div class="message">' +
               '<span class="author">' +
                 (message.author || 'Anonymous') +
                 ' ' + //makes it look the same as erb
               '</span>' +
               '<span class="content">' +
                 message.content +
               '</span>' +
             '</div>' +
            '</div>';
  }
});
