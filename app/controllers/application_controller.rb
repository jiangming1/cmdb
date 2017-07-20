class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def log
      redirect_to dengluzhanghus_url(message: 'test'), notice: '需要账号密码' if cookies[:id] != "1"
  end
  def options_from_collection_for_select_with_attributes(collection, value_method, text_method, attr_name, attr_field, selected = nil)
  options = collection.map do |element|
    [element.send(text_method), element.send(value_method), attr_name => element.send(attr_field)]
  end
  
  selected, disabled = extract_selected_and_disabled(selected)
  select_deselect = {}
  select_deselect[:selected] = extract_values_from_collection(collection, value_method, selected)
  select_deselect[:disabled] = extract_values_from_collection(collection, value_method, disabled)

  options_for_select(options, select_deselect)
end
  
  
end
