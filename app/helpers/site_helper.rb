module SiteHelper

  def msg_jumbotron
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas..."
    when 'questions'
      "Resultados para \"#{params[:term]}\"..."
    when 'subject'
      "Questões sobre o assunto \"#{params[:subject]}\"..."
    end
  end
end
