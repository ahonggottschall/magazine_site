class SessionsController < ApplicationController




def create
  @user = User.find_by_email_and_password( params[:email], params[:password] )

  if @user.present?
    session[:user_id] = @user.id
    flash[:notice] = "You have logged in successfully!"
    redirect_to request.referer
  else
    flash[:notice] = "Invalid login"
    redirect_to request.referer
  end
end

def destroy
  session.delete(:user_id)
  redirect_to request.referer
end



end
