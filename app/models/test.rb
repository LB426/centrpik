class Test < ActiveRecord::Base
  belongs_to :user
  has_many :test_questions, dependent: :destroy
end
