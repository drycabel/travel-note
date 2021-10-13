class PostDecorator
    def initialize(post)
        @post = post
    end

    def short_note
        @post&.note&.truncate(27) || "-"
    end


    delegate :city, :note_date, :note, to: :@post
end