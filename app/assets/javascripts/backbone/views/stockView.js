var StockView = Backbone.View.extend({
  className: "stock",
  tagName: "div",

  initialize: function() {
    console.log("loaded stock view");
    this.render();
    this.listenTo(this.model, 'change', this.render);
  },
  render: function() {
  	// this.$el.empty();
  	// this.$el.append("<p>" + this.model.get("body") + "</p>");
  	// this.$el.append("<div class='finish'>Finish</div>");
  	var renderedHTML = HandlebarsTemplates['stocks/show'](this.model.toJSON());
 	  this.$el.html(renderedHTML);
  },
  events: {
  	'click.delete': 'delete'
  },
  delete: function() {
  var view = this;
  this.model.destroy()
    .done(function(){
      view.$el.fadeOut();
    })
    .fail(function() {
      alert("Oops! There was an error destroying that reminder. Please try again later.");
    });
}
});