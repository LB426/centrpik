class TestQuestion < ActiveRecord::Base
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_attached_file :picture, styles: { medium: "640x480>", thumb: "100x100>" },
                              default_url: "/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end

