class PostDecorator
    def initialize(post)
        @post = post
    end

    def short_note
        @post&.note&.truncate(27) || "-"
    end

    def temperature
        @post.temp? ? "#{@post.temp} °C" : ' '
    end


    delegate :city, :note_date, :note, :temp, to: :@post
end