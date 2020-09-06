class Genre < ActiveHash::Base

  self.data = [
    {id: 0, name: 'サッカー'}, {id: 1, name: '野球'},
    {id: 2, name: 'テニス'}, {id: 3, name: 'バレーボール'}, {id: 4, name: 'ラグビー'},
    {id: 5, name: 'ゴルフ'},{id:6, name:'バスケットボール'},{id:7, name:'その他'}
  ]
end
