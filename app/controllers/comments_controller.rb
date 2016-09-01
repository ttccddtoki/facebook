class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topix = @comment.topix

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topix_path(@topix), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @topix = @comment.topix
    respond_to do |format|
    @comment.destroy
    format.js { render :index }
    end
  end

  def edit
    
  end
  def show
    @comment = @topix.comments.build
    @comments = @topix.comments
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topix_id, :content)
    end
end
