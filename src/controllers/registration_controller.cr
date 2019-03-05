class RegistrationController < ApplicationController
  def new
    user = User.new
    render("new.slang")
  end

  def create
    user = User.new
    user.email = params["email"].to_s
    user.password = params["password"].to_s
    changeset = Repo.insert(user)

    if changeset.valid?
      session[:user_id] = user.id
      flash[:success] = "Created User successfully."
      redirect_to "/"
    else
      flash[:danger] = "Could not create User!"
      render("new.slang")
    end
  end

  private def registration_params
    params.validation do
      required(:email) { |f| !f.nil? }
      required(:password) { |f| !f.nil? }
    end
  end
end
