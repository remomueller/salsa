@setFocusToField = (element_id) ->
  val = $(element_id).val()
  $(element_id).focus().val('').val(val)

@globalReady = ->
  false

@extensionsReady = ->
  # datepickerReady()
  # tooltipsReady()
  # typeaheadReady()
  false

@componentsReady = ->
  false

@objectsReady = ->
  false

@ready = ->
  globalReady()
  extensionsReady()
  componentsReady()
  objectsReady()

$(document).ready(ready)
$(document)
  .on('turbolinks:load', ready)
