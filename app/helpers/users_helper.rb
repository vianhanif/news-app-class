module UsersHelper

  def approve_path user
    "/approve/#{user.id}"
  end
end
