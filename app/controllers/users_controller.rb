class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @user = User.new
    end

    def create
    #create new user with new and set corresponding attributes from params hash
        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]

    #save new user to database, if successful add flash and redirect, otherwise display error
        if @user.save
            flash[:notice] = "Welcome to Bloccit #{@user.name}!"
            create_session(@user)
            redirect_to root_path
        else
            flash.now[:alert] = "There was an error creating your account. Please try again."
            render :new
        end
    end
    
    def confirm 
        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts.visible_to(current_user)
        @faves = @user.favorites.visible_to(current_user)
    end

end
