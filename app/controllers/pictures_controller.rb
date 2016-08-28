class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only:[:edit, :update, :destroy]

  def index
    @pictures = Picture.all.order("id").reverse_order
  end

  def new
    if params[:back]
    @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_picture(@picture).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  if  @picture.update(pictures_params)
    redirect_to pictures_path, notice: "投稿を編集しました！"
  else
    render action: 'edit'
  end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end


  private
   def pictures_params
     params.fetch(:picture, {}).permit(:image)
   end

   def set_picture
      @picture = Picture.find(params[:id])
  end
end
