class UsersController < Clearance::UsersController
  def create
    @user = user_from_params
    @user.confirmation_token = Clearance::Token.new
    if @user.save
      # send confirmation email
      UserMailer.confirm(@user).deliver_now
      flash[:notice] = "Please confirm your email address."
      redirect_to sign_in_url
    else
      render template: "users/new"
    end
  end

  def confirm
    token = params[:token]
    @user = User.find_by(confirmation_token: token)
    if @user
      @user.confirmed_at = Time.current
      @user.save
      flash[:success] = "Your email is now confirmed. Please sign in"
      redirect_to sign_in_url
    end
  end

  private
    def user_params
      params[:user].permit(:email, :password, :username) 
    end
end
