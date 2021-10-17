require "test_helper"

class PostTest < ActiveSupport::TestCase
    setup do
        @user = users(:user)
    end

    test "should not create a post without mandatory values" do
        test_post = Post.new
        assert_not test_post.save, "Should not create an empty post"

        test_post = Post.new(note: 'Note', note_date: Date.today, temp: 21.37, creator_id: @user.id)
        assert_not test_post.save, "Should not create post without the City value"

        test_post = Post.new(city: 'Warszawa', note_date: Date.today, temp: 21.37, creator_id: @user.id)
        assert_not test_post.save, "Should not create post without the Note value"

        test_post = Post.new(city: 'Warszawa', note: 'Note', temp: 21.37, creator_id: @user.id)
        assert_not test_post.save, "Should not create post without the note_date value"

        test_post = Post.new(city: 'Warszawa', note: 'Note', note_date: Date.today, creator_id: @user.id)
        assert_not test_post.save, "Should not create post without the temperature value"

        test_post = Post.new(city: 'Warszawa', note: 'Note', note_date: Date.today, temp: 21.37)
        assert_not test_post.save, "Should not create post without a creator"
    end
end
