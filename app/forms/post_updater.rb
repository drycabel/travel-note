class PostUpdater
    include ActiveModel::Model

    attr_accessor :city, :note, :post_id, :current_user
    validates :city, :note, :post_id, presence: true
    validate :post_belongs_to_current_user


    def save
        return false unless valid?
        post.update!(city: city, note: note, temp: temp)

        true
    rescue => e
        errors.add(:base, "Something went wrong - #{e.inspect}")
        false
    end

    def temp
        @temp ||=  OpenWeather::Client.new().current_weather(city: city).main.temp
    end

    def post
        @post ||= Post.find(post_id)
    end

    private

    def post_belongs_to_current_user
        return if post.creator_id == current_user
        errors.ad(:base, "You are not creator of this post")
    end
end
