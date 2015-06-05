var StockView = Backbone.View.extend({
  className: "stock",
  tagName: "div",

  initialize: function() {

    this.render();
    this.listenTo(this.model, 'change', this.render);
  },
  render: function() {
  	var renderedHTML = HandlebarsTemplates['stocks/show'](this.model.toJSON());
 	  this.$el.html(renderedHTML);
  },
  events: {
  	'click #remove': 'remove'
  },
  remove: function() {
  var view = this;
  this.model.destroy().done(function(){
      view.$el.fadeOut();
    })
    .fail(function() {
      alert("Oops! There was an error destroying that reminder. Please try again later.");
    });
}
});