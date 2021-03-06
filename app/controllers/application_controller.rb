class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User 
      todo_lists_url
    else
      super
    end
  end
end
