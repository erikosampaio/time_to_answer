class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual Attributes
  def total_questions
    self.right_questions + self.wrong_questions
  end

  # Class method
  def self.set_statistic(answer, current_user)
    # Se o usuário NÃO ESTIVER logado, current_user é nil. Com um ! ele se tornaria true, e com mais um ! ele se tornaria em false.
    # Se o usuário ESTIVER logado, current_user é o usuário logado. Com um ! ele se tornaria false, e com mais um ! ele se tornaria true.
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1
      user_statistic.save
    end
  end
end
