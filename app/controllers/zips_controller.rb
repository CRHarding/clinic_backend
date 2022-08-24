class ZipsController < ApplicationController
  def index
    zip = Zip.find_by("zip=?", (params[:id]))
    render :json => zip.to_json
  end
end
