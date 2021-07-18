class Word < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pos
  belongs_to :genre

  with_options presence: true do
    validates :name, :pos_id, :meaning, :genre_id
  end
end
