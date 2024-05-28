ConfusedTechieTestPackage9999 = require '../lib/confused-techie-test-package-9999'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ConfusedTechieTestPackage9999", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('confused-techie-test-package-9999')

  describe "when the confused-techie-test-package-9999:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.confused-techie-test-package-9999')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'confused-techie-test-package-9999:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.confused-techie-test-package-9999')).toExist()

        confusedTechieTestPackage9999Element = workspaceElement.querySelector('.confused-techie-test-package-9999')
        expect(confusedTechieTestPackage9999Element).toExist()

        confusedTechieTestPackage9999Panel = atom.workspace.panelForItem(confusedTechieTestPackage9999Element)
        expect(confusedTechieTestPackage9999Panel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'confused-techie-test-package-9999:toggle'
        expect(confusedTechieTestPackage9999Panel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.confused-techie-test-package-9999')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'confused-techie-test-package-9999:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        confusedTechieTestPackage9999Element = workspaceElement.querySelector('.confused-techie-test-package-9999')
        expect(confusedTechieTestPackage9999Element).toBeVisible()
        atom.commands.dispatch workspaceElement, 'confused-techie-test-package-9999:toggle'
        expect(confusedTechieTestPackage9999Element).not.toBeVisible()
