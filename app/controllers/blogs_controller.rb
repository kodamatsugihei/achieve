class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    # user_idを代入する
    if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      # 入力フォームを再描画します。
      render 'new'
    end

  end

  def edit
    # edit, update, destroyで共通コード
    @blog = Blog.find(params[:id])
  end

  def update
    # edit, update, destroyで共通コード
    @blog = Blog.find(params[:id])
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    # edit, update, destroyで共通コード
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

end
