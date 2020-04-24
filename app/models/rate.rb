class Rate < ApplicationRecord

  belongs_to :user
  
  enum feel: { "気分が悪い": 0,  "少し気分が悪い": 1,  "何ともない": 2, "気分が良い": 3 , "とても気分が良い":4}, _prefix: true
  enum awake: { "まだ眠い": 0,  "少し眠い": 1,  "何ともない": 2, "すんなり起きた": 3 , "スッキリ起きた":4}, _prefix: true
  enum sleep: { "寝れなかった": 0,  "少し寝れた": 1,  "何ともない": 2, "眠れた": 3 , "よく眠れた":4}, _prefix: true
  enum tired: { "とても疲れた": 0,  "少し疲れた": 1,  "何ともない": 2, "元気": 3 , "とても元気":4}, _prefix: true
  enum body: { "体が重い": 0,  "少し体が重い": 1,  "何ともない": 2, "体が軽い": 3 , "体かとても軽い":4}
end
