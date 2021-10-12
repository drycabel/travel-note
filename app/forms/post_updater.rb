class PostUpdater
    include ActiveModel::Model

    attr_accessor :city, :note, :post_id
    validates :city, :note, :post_id, presence: true


    def save
        return false unless valid?
        post.update!(city: city, note: note)

        true
    rescue => e
        errors.add(:base, "Something went wrong - #{e.inspect}")
        false
    end

    def post
        @post ||= Post.find(post_id)
    end
end
