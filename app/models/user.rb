class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :words, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :good_words, through: :goods, source: :word
  has_many :adoptions, dependent: :destroy
  has_many :adoption_words, through: :adoptions, source: :word
  has_many :tests

  validates :nickname, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  def good(word)
    goods.find_or_create_by(word: word)
  end

  def good?(word)
    good_words.include?(word)
  end

  def ungood(word)
    good_words.delete(word)
  end

  def adoption(word)
    adoptions.find_or_create_by(word: word)
  end

  def unadoption(word)
    adoption_words.delete(word)
  end

  def adoption_word_create(word)
    Word.create(word)
  end
end
