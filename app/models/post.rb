class Post < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: :creator_id

    validates :city, :note, :note_date, :temp, presence: true

end