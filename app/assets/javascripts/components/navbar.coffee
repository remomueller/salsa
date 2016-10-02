$(document)
  # This collapses the menu on mobile devices after clicking a link in it.
  .on('click', '[data-object~="remove-collapse-in"]', () ->
    $($(this).data('target')).removeClass('in')
  )
  .on('click', '[data-object~=scroll-anchor]', (event) ->
    # Make sure this.hash has a value before overriding default behavior
    if @hash != '' and $(@hash).length > 0
      $('[data-object~=scroll-anchor]').parent().removeClass('active')
      $(this).parent().addClass('active')
      # Prevent default anchor click behavior
      event.preventDefault()
      # Store hash
      hash = @hash
      $('html, body').animate { scrollTop: $(hash).offset().top }, 400
  )
