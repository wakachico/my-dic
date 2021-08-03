class Answer < ApplicationRecord
  belongs_to :test
  belongs_to :word

  validates :score,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1}
end
