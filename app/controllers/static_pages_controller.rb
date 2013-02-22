class StaticPagesController < ApplicationController
  layout :choose_layout
  
  def choose_layout
    if action_name == 'home'
      'home'  
    else
      'application'
    end
  end
  
  def home
  end

  def about
  end
end
