require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  before do
    @inquiry = Inquiry.new(name: 'name',
                           email: 'hogehoge@gmail.com',
                           message: 'message')
  end
  let(:mail) { InquiryMailer.received_email(@inquiry) }

  it 'received email header' do
    expect(mail.subject).to eq 'お問い合わせありがとうございます'
    expect(mail.to.first).to eq @inquiry.email
  end
end
