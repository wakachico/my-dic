class Word < ApplicationRecord
  belongs_to :user
  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user
  has_many :adoptions, dependent: :destroy
  has_many :adoption_users, through: :adoptions, source: :user
  has_many :answers

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pos
  belongs_to :genre

  with_options presence: true do
    validates  :name, :pos_id, :meaning, :genre_id
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
      Word.where(user_id: id).select('words.*', 'count(adoptions.id) AS ados').left_joins(:adoptions).group('words.id').order('ados desc')
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
      Word.select('words.*', 'count(adoptions.id) AS ados').left_joins(:adoptions).group('words.id').order('ados desc')
    elsif condition == "6"
      Word.order(pos_id: :asc)
    elsif condition == "7"
      Word.order(genre_id: :asc)
    end
  end

  def self.questions(id)
    ok_id=[]                                  #条件を満たしたWord情報のword_idを格納
    5.times do
      count = 0
      while count < 1
        last = Word.last.id                   #wordsテーブルに保存されている最後のword_idを取得
        num = rand(0..last)                   #ランダムに１件取得するようの"num"変数を用意
        word = Word.find_by('id >= ?', num)   #num変数以上のword_id情報の中で最初の１件を取得 ※削除機能により抜け番が発生するため
        if word != nil && word.user_id == id  #word!=nilは保険。word.user_id == id はcurrent_userが登録したword情報かを判別
          if ok_id.empty?                     #oK_id配列が空だったとき
            ok_id.push(word.id)                 #条件を満たすword_idをok_idに追加
            count = 1
          end
          unless ok_id.include?(word.id)      #oK_id配列に条件を満たすword_idを含まないとき ※テスト問題の一意性を出すため
            ok_id.push(word.id)                 #条件を満たすword_idをok_idに追加
            count = 1
          end
        end
      end
    end
    words = Word.where(id: ok_id)             #条件をクリアした５件のword_idが格納されたok_idをword_idにもつwordを"words"に格納する
    return words
  end
end
