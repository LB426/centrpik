class Test < ActiveRecord::Base
  belongs_to :user
  has_many :test_questions, dependent: :destroy
  has_many :testing_stat_attempts
end
