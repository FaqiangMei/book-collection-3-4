class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    Rails.logger.info ">>>> Entered google_oauth2 callback"
    Rails.logger.info ">>>> Raw omniauth.auth = #{request.env["omniauth.auth"].inspect}"

    @admin = Admin.from_google(**from_google_params)

    if @admin.persisted?
      Rails.logger.info ">>>> Successfully authenticated Admin: #{@admin.email}"
      sign_out_all_scopes
      flash[:notice] = "Successfully authenticated from Google account."
      sign_in_and_redirect @admin, event: :authentication
    else
      Rails.logger.warn ">>>> Google authentication failed for: #{from_google_params[:email]}"
      flash[:alert] = "Google authentication failed."
      redirect_to new_admin_session_path
    end
  end

  private

  def from_google_params
    auth = request.env["omniauth.auth"]
    {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image
    }
  end
end
