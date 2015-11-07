class TestingResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  belongs_to :test_question
  belongs_to :answer
  belongs_to :testing_stat_attempt
end
