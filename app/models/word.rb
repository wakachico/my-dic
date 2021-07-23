class Word < ApplicationRecord
  belongs_to :user
  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user

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

  def self.order_mydic(condition,id)
    if condition == "1" 
      Word.where(user_id: id).order(created_at: :desc)
    elsif condition == "2"
      Word.where(user_id: id).order(created_at: :asc)
    elsif condition == "3"
      Word.where(user_id: id).order(name: :asc)
    elsif condition == "4"
      Word.where(user_id: id).order(important: :desc)
    elsif condition == "5"
      Word.where(user_id: id).select('words.*', 'count(goods.id) AS goos').left_joins(:goods).group('words.id').order('goos desc')
    elsif condition == "6"
      Word.where(user_id: id).order(name: :asc) #採用数順（保留）
    elsif condition == "7"
      Word.where(user_id: id).order(pos_id: :asc)
    elsif condition == "8"
      Word.where(user_id: id).order(genre_id: :asc)
    end
  end

  def self.order_index(condition)
    if condition == "1" 
      Word.order(created_at: :desc)
    elsif condition == "2"
      Word.order(created_at: :asc)
    elsif condition == "3"
      Word.order(name: :asc)
    elsif condition == "4"
      Word.select('words.*', 'count(goods.id) AS goos').left_joins(:goods).group('words.id').order('goos desc')
    elsif condition == "5"
      Word.order(name: :asc) #採用数順（保留）
    elsif condition == "6"
      Word.order(pos_id: :asc)
    elsif condition == "7"
      Word.order(genre_id: :asc)
    end
  end
end
