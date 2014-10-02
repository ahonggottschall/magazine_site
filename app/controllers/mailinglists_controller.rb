class MailinglistsController < ApplicationController

  def sign_up
    @name = params[:name]
  end
end
