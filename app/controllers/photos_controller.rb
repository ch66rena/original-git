class PhotosController < ApplicationController
  
  def index

  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new(photo_id: @photo.id)
    @comments = @photo.comments
  end



  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    #binding.pry
    if @photo.save    
      flash[:success] = '写真 が正常に投稿されました'
      redirect_to @photo
    else
      @user = current_user
      flash.now[:danger] = '写真 が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    #binding.pry
    @photo.destroy

    flash[:success] = '写真 は正常に削除されました'
    redirect_to root_url    
  end
  
  private

  def photo_params
    params.require(:photo).permit(:user_id, :image, :image_cache, :remove_image)
  end

  def correct_user
    @photo = current_user.photo.find_by(id: params[:id])
    unless @photo
      redirect_to root_url
    end
  end

end
