class Answer < ApplicationRecord
  belongs_to :test

  validates :score,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2}
end
