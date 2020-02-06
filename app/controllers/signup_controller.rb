class SignupController < ApplicationController
  def step1
    @user = User.new
  end
   
  def step2
    @user = User.new
  end
    
  def step3
    @user = User.new
  end

  def done
    @user = User.new
  end
end
