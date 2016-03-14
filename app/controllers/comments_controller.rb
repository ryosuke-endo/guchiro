class CommentsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  before_action :set_my_comment, only: [:destroy]

  def index
    @user = current_user
    @grumbles = @user.comment_grumbles.order(created_at: :desc).page(params[:page])
  end

  def create
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.build(comment_params)
    @comment.anonymous_digest = User.set_anonymous_digest
    @comment.user = current_user
    if @comment.save
      redirect_to grumble_path(@grumble)
    else
      render template: 'grumbles/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_my_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end
end
