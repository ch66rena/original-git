class CommentsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    binding.pry
    @comment = current_user.comments.build(comment_params)
    @photo = @comment.photo
    if @comment.save
      flash[:success] = "コメントが投稿されました。"
      redirect_to @photo
    else
      @comments = @photo.comments
      flash.now[:danger] = "コメントが投稿されませんでした。。"
      render 'photo/show'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    #binding.pry
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :photo_id)
  end

  def correct_user
    @photo = current_user.photo.find_by(id: params[:id])
    unless @photo
      redirect_to root_url
    end
  end

end
