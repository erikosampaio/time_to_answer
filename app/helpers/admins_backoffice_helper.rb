module AdminsBackofficeHelper

  def translate_attributes(object = nil, method = nil)
    object.present? && method.present? ? object.model.human_attribute_name(method) : "Informe os parâmetros corretamente"
  end
end
