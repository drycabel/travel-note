class PostCreator
    include ActiveModel::Model

    attr_accessor :city, :note, :current_user
    validates :city, :note, presence: true

    def save
        return false unless valid?
        ActiveRecord::Base.transaction do
            post.save!
        end

        true

    rescue => e
        errors.add(:base, "Something went wrong - #{e.inspect}")
        false
    end

    def temp
        @temp ||=  !city.present? ? nil : OpenWeather::Client.new().current_weather(city: city).main.temp
    end

    def post
        @post ||= Post.new(city: city, note: note, note_date: Date.today, temp: temp, creator_id: current_user)
    end
end