class PhotosController < ApplicationController

  def index

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    # @photo = Photo.new(photo_params)
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
    @photo.destroy

    flash[:success] = 'photo は正常に削除されました'
    redirect_to photos_url    
  end
  
  private

 private

  def photo_params
    params.require(:photo).permit(:user_id, :image, :image_cache, :remove_image)
  end
end
