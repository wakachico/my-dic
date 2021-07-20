class Word < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pos
  belongs_to :genre

  with_options presence: true do
    validates :name, :pos_id, :meaning, :genre_id
  end

  def self.search_mydic(search,condition,category,id)
    if search != ""
      if condition == "1" 
        if category == "1"
          Word.where('name LIKE(?) OR meaning LIKE(?) OR text LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%").where(user_id: id)
        elsif category == "2"
          Word.where('name LIKE(?)', "%#{search}%").where(user_id: id)
        elsif category == "3"
          Word.where('meaning LIKE(?)', "%#{search}%").where(user_id: id)
        elsif category == "4"
          Word.where('text LIKE(?)', "%#{search}%").where(user_id: id)
        end
      elsif condition == "2" 
        if category == "1"
          Word.where('name LIKE(?) OR meaning LIKE(?) OR text LIKE(?)', "#{search}%", "#{search}%", "#{search}%").where(user_id: id)
        elsif category == "2"
          Word.where('name LIKE(?)', "#{search}%").where(user_id: id)
        elsif category == "3"
          Word.where('meaning LIKE(?)', "#{search}%").where(user_id: id)
        elsif category == "4"
          Word.where('text LIKE(?)', "#{search}%").where(user_id: id)
        end
      end
    else
      Word.where(user_id: id)
    end
  end

  def self.search_index(search,condition,category)
    if search != ""
      if condition == "1" 
        if category == "1"
          Word.where('name LIKE(?) OR meaning LIKE(?) OR text LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
        elsif category == "2"
          Word.where('name LIKE(?)', "%#{search}%")
        elsif category == "3"
          Word.where('meaning LIKE(?)', "%#{search}%")
        elsif category == "4"
          Word.where('text LIKE(?)', "%#{search}%")
        end
      elsif condition == "2" 
        if category == "1"
          Word.where('name LIKE(?) OR meaning LIKE(?) OR text LIKE(?)', "#{search}%", "#{search}%", "#{search}%")
        elsif category == "2"
          Word.where('name LIKE(?)', "#{search}%")
        elsif category == "3"
          Word.where('meaning LIKE(?)', "#{search}%")
        elsif category == "4"
          Word.where('text LIKE(?)', "#{search}%")
        end
      end
    else
      Word.all
    end
  end
end
