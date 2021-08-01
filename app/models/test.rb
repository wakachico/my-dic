class Test < ApplicationRecord
  belongs_to :user
  has_many :answers

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type

  validates :type_id, presence: true
end
