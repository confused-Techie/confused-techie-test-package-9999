ConfusedTechieTestPackage9999View = require './confused-techie-test-package-9999-view'
{CompositeDisposable} = require 'atom'

module.exports = ConfusedTechieTestPackage9999 =
  confusedTechieTestPackage9999View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @confusedTechieTestPackage9999View = new ConfusedTechieTestPackage9999View(state.confusedTechieTestPackage9999ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @confusedTechieTestPackage9999View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'confused-techie-test-package-9999:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @confusedTechieTestPackage9999View.destroy()

  serialize: ->
    confusedTechieTestPackage9999ViewState: @confusedTechieTestPackage9999View.serialize()

  toggle: ->
    console.log 'ConfusedTechieTestPackage9999 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
