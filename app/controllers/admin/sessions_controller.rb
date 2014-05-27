module Admin
  class SessionsController < AdminController
    protect_from_forgery :except => [:create]
    skip_before_filter :require_login, except: [:destroy]

    def new
    end

    def create
      if authenticator.authenticate(env['omniauth.auth'])
        redirect_to admin_root_url, notice: "Signed in!"
      else
        redirect_to admin_sign_in_url, alert: "Sorry, authentication failed. Your domain may not be allowed access."
      end
    end

    def failure
      redirect_to admin_sign_in_url, alert: "Sorry, authentication failed. Did you grant access?"
    end

    def destroy
      authenticator.clear_user
      redirect_to admin_sign_in_url, notice: "Signed out!"
    end
  end
end