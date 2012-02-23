class AfterRegisterController < ApplicationController
  before_filter :authenticate_user!


  def show
    @user = current_user
  end

  def update

  end
end
