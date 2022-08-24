class AirportsController < ApplicationController
  def index
    params[:lat] = params[:lat].to_f
    params[:lon] = params[:lon].to_f
    airports = Airport.get_close_airports(params[:lat], params[:lon])

    render :json => airports.as_json.map{|elem|elem.merge!("distance"=>3963.0*Math::acos(Math.sin(params[:lat]/57.295779513082323) * Math.sin(elem['lat']/57.295779513082323) + Math.cos(params[:lat]/57.295779513082323) * Math.cos(elem['lat']/57.295779513082323) * Math.cos((params[:lon]-elem['lon'])/57.295779513082323)))}
  end
end
