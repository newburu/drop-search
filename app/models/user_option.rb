class UserOption < ApplicationRecord
  belongs_to :user

  enum server: {Sirius: 1, Isilorte: 3, Arcturus: 4, Rigel: 5, Unity: 7, Depolojiu: 8}

end
