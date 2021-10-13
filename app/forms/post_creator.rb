class PostCreator
    include ActiveModel::Model

    attr_accessor :city, :note
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
        @temp ||=  OpenWeather::Client.new().current_weather(city: city || 'Warsaw').main.temp
    end

    def post
        @post ||= Post.new(city: city, note: note, note_date: Date.today, temp: temp)
    end

    private

end