class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def new
        @form = PostCreator.new
    end

    def create
        @form = PostCreator.new(post_params)
        if @form.save
            redirect_to posts_path, notice: "Post created successfully"
        else
            render :new
        end
    end

    def edit
        if Post.exists?(params[:id])
            @form = PostUpdater.new(post_id: params[:id])
        else
            redirect_to posts_path, alert: "Post with id: #{params[:id]} doesn't exist"
        end
    end

    def update
        @form = PostUpdater.new(post_params.merge(post_id: params[:id]))
        if @form.save
            redirect_to posts_path, notice: "Post updated successfully"
        else
            render :edit
        end
    end

    def destroy
        service = PostDestroyer.new(params[:id])
        key = (service.destroyed_successfully? ? "notice" : "alert")
        redirect_to posts_path, {"#{key}": service.msg}
    end

    def show
        if Post.exists?(params[:id])
            @post = Post.find_by_id(params[:id])
        else
            redirect_to posts_path, alert: "Something went wrong"
        end
    end




    private

    def post_params
        params.permit(:city, :note, :note_date)
    end
end