class InquiryController < ApplicationController
  skip_before_action :require_login, only: [:index, :confirm, :thanks]
  def index
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render action: 'confirm'
    else
      render action: 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    render action: 'thanks'
  end

    private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
