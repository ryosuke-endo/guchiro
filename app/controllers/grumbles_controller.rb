class GrumblesController < ApplicationController
  skip_before_action :require_login, only: [:new, :show, :create]
  before_action :set_anonymous_digest, only: [:create]
  before_action :find_hash_tag, only: [:create]

  def index
    @user = current_user
    @grumbles = @user.grumbles.order(created_at: :desc).page(params[:page])
  end

  def new
    @grumble = Grumble.new
  end

  def show
    @grumble = Grumble.find_by(id: params[:id])
    @comment = @grumble.comments.new
    @comments = @grumble.comments.includes(:grumble)
  end

  def create
    @grumble = Grumble.new(grumble_params)
    @grumble.anonymous_digest = @grumble_anonymous_digest
    @grumble.tag_list.add(@grumble_tags)
    @grumble.user = current_user
    if @grumble.save
      redirect_to root_url
    else
      render 'grumbles/new'
    end
  end

  private

    def grumble_params
      params.require(:grumble).permit(:body)
    end

    def set_anonymous_digest
      @grumble_anonymous_name = get_anonymous_name
      @grumble_anonymous_digest = get_anonymous_digest(@grumble_anonymous_name, 8)
    end

    def find_hash_tag
      body = params[:grumble][:body]
      filter = /[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/
      @grumble_tags = body.scan(filter).map(&:strip)
      @grumble_tags.map { |tag| tag.delete!('#') }
    end
end
