class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '例文' },
    { id: 2, name: '語呂' },
    { id: 3, name: 'フレーズ' },
    { id: 4, name: '発音記号' },
    { id: 5, name: 'レベル' },
    { id: 6, name: '歌詞' },
    { id: 7, name: '歌手' },
    { id: 8, name: 'アニメ' },
    { id: 9, name: 'キャラ' },
    { id: 10, name: 'カリキュラム' },
    { id: 11, name: 'メモ' }
  ]

  include ActiveHash::Associations
  has_many :words

end