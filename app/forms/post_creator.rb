class PostCreator
    include ActiveModel::Model

    attr_accessor :city, :note
    validates :city, :note, presence: true

    def save
        return false unless valid?
        ActiveRecord::Base.transaction do
            post.save!
        end

        false
    rescue => e
        errors.add(:base, "Something went wrong - #{e.inspect}")
        false
    end

    def post
        @post ||= Post.new(city: city, note: note, note_date: Date.today)
    end
end