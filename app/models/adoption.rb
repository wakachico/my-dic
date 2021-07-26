class Adoption < ApplicationRecord
  belongs_to :word
  belongs_to :user

  validates_uniqueness_of :word_id, scope: :user_id
end
