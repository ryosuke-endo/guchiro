class GrumblesController < ApplicationController
  skip_before_action :require_login, only: [:new, :show, :create, :tag_list]
  before_action :find_hash_tag, only: [:create]

  def index
    @user = current_user
    @grumbles = @user.grumbles.order(created_at: :desc).page(params[:page])
  end

  def new
    @grumble = Grumble.new
    @grumbles = Grumble.order(created_at: :desc).page(params[:page])
  end

  def show
    @grumble = Grumble.find_by(id: params[:id])
    @comment = @grumble.comments.new
    @comments = @grumble.comments.includes(:grumble)
  end

  def create
    @grumble = Grumble.new(grumble_params)
    @grumble.anonymous_digest = User.set_anonymous_digest
    @grumble.tag_list.add(@grumble_tags)
    @grumble.user = current_user
    if @grumble.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def tag_list
    @tag = params[:tag]
    @grumbles = Grumble.tagged_with(@tag).order(created_at: :desc).page(params[:page])
  end

  private

  def grumble_params
    params.require(:grumble).permit(:body)
  end

  def find_hash_tag
    body = params[:grumble][:body]
    filter = /[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/
    @grumble_tags = body.scan(filter).map(&:strip)
    @grumble_tags.map { |tag| tag.delete!('#') }
  end
end
