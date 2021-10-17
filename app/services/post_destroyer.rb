class PostDestroyer
    attr_reader :msg

    def initialize(post_id, current_user)
        @current_user = current_user
        @post_id = post_id
    end

    def post
        return @post if defined? @post
        @post = Post.find_by_id(@post_id)
    end

    def destroyed_successfully?
        return false unless validations_succeed?
        post.destroy!

        @msg = "Post destroyed successfully"
        true
    rescue => e
        @msg = "Somethinf went wrong - #{e.inspect}"
        false
    end

    private

    def validations_succeed?
        @msg = "You have to be logged in" and return false if @current_user.blank?

        @msg = "Post doesn't exist" and return false if post.blank?

        @msg = "You are not cretor" and return false if post.creator_id != @current_user.id

        true
    end
end