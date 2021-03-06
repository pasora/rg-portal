jQuery ($) ->
  $('body.privileges').each( ->
    setPrivilegeFormValues = ($target) ->
      $option = $target.children('option:selected')
      model = $option.attr('data-model')
      console.log('model: ', model)
      action = $option.attr('data-action')
      console.log('action: ', action)
      $form = $target.closest('form')
      $form.children('[name="privilege[model]"]').val(model)
      $form.children('[name="privilege[action]"]').val(action)

    setPrivilegeFormValues($('select#privilege').change( ->
      setPrivilegeFormValues($(this))
    ))
  )
