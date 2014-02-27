export default Ember.Route.extend({
  model: function() {
    return this.store.createRecord("survey");
  },
  actions: {
    save: function() {
      var _this = this;
      this.currentModel.save().then(function() {
        _this.transitionTo("surveys.show", _this.currentModel);
      });
    }
  }
});
