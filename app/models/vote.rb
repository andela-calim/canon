class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  #todo change ... or get question.voters
end
