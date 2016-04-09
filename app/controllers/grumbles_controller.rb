class GrumblesController < ApplicationController
  skip_before_action :require_login, only: [:new, :show, :create, :tag_list]
  before_action :extract_hash_tag, only: [:create]
  before_action :set_user_grumble_cheers, only: [:new, :show]
  before_action :set_user_grumble_sympathies, only: [:new, :show]

  def index
    @user = current_user
    @grumbles = @user.grumbles.page(params[:page]).including_tags
  end

  def new
    @grumble = Grumble.new
    @grumbles = Grumble.order(created_at: :desc).page(params[:page]).includes(:user, :tags)
  end

  def show
    @grumble = Grumble.find_by(id: params[:id])
    @comment = Comment.new
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

  def set_user_grumble_cheers
    @user_grumble_cheers = current_user.grumble_cheers if current_user
  end

  def set_user_grumble_sympathies
    @user_grumble_sympathies = current_user.grumble_sympathies if current_user
  end

  def extract_hash_tag
    body = params[:grumble][:body]
    filter = /[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/
    @grumble_tags = body.scan(filter).map(&:strip)
    @grumble_tags.map { |tag| tag.delete!('#') }
  end
end
