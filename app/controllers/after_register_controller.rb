class AfterRegisterController < ApplicationController
  before_filter :authenticate_user!


  def show
    @user = User.last
  end

  def update

  end
end
