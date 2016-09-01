class TopixesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topix, only:[:edit, :update, :destroy]

  def index
    @topixes = Topix.all.order("id").reverse_order
  end

  def new
    if params[:back]
    @topix = Topix.new(topixes_params)
    else
      @topix = Topix.new
    end
  end

  def create
    @topix = Topix.new(topixes_params)
    @topoix.user_id = current_user.id
    if @topix.save
      redirect_to topixes_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_topix(@topix).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  if  @topix.update(topixes_params)
    redirect_to topixes_path, notice: "投稿を編集しました！"
  else
    render action: 'edit'
  end
  end

  def destroy
    @topix.destroy
    redirect_to topixes_path, notice: "投稿を削除しました！"
  end


  private
   def topixes_params
     params.fetch(:topix, {}).permit(:image, :content)
   end

   def set_topix
      @topix = Topix.find(params[:id])
  end
end
