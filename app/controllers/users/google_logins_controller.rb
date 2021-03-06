class Users::GoogleLoginsController < ApplicationController
  def create
    @user = User.find_by(google_id: params[:google_id]) if params[:google_id].present?
    if @user
      render json: @user, serializer: CurrentUserSerializer, status: 200
    else
      @user = User.create!(user_params)
      render json: @user, serializer: CurrentUserSerializer, status: 201
    end
  end

  private

    def user_params
      params.permit(:fullname, :email, :avatar, :google_id)
    end

    # def generate_unique_fullname
    #   name = User.find_by(fullname: params[:fullname]).split.join('-').downcase
    #   loop do
    #     fullname = "#{name}#{SecureRandom.random_number(1000..9999).to_s}"
    #     break fullname unless User.exists?(fullname: fullname)
    #   end
    # end
end