//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('ChatChannel', {
  received: function(data) {
    return $('#edwin-container').prepend(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return '<div>' +
             '<div class="message">' +
               '<span class="author">' +
                 data.author +
               '</span>' +
               '<span class="conten">' +
                 data.content +
               '</span>' +
             '</div>' +
            '</div>';
  }
});
