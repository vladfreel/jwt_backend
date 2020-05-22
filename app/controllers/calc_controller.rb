class CalcController < ApplicationController
  skip_before_action :require_login
  def string_calculation
    render json: {res: params[:firstString]+params[:secondString]}
  end
end
