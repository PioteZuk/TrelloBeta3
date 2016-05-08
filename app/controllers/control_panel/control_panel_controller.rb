class ControlPanel::ControlPanelController < ApplicationController
	layout 'control_panel'
	before_action :authenticate_user!
	# before_action :authorize_user 

	# def authorize_user
	# 	return if current_user.present?
	# 	redirect_to root_path, alert: 'You do not have permission'
	# end

end