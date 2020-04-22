class Rate < ApplicationRecord

  belongs_to :user
  
  enum feel: { "気分が悪い": 0,  "少し気分が悪い": 1,  "何ともない": 2, "気分が良い": 3 , "とても気分が良い":4}
end
