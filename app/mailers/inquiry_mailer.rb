class InquiryMailer < ApplicationMailer
  default from: 'noreplay@guchiro.com'

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: 'お問い合わせありがとうございます')
  end
end
