class TermsController < ApplicationController
  skip_before_action :require_login, only: [:tos]

  def tos
  end
end
