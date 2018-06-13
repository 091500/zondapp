class PointsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :webhook_create]
  
  def index
    @points = Point.all.to_a
  end
  
  def create
    point = Point.create(permit_params(params))
    point.save!
  end

  def webhook_create
    point = Point.create(permit_params(params))
    point.save!
    
    render body: nil
  end
  
  def json
    render json: prepare_points_for_google(Point.all.to_a)
  end
  
  private
  
  def prepare_points_for_google(points)
    points.map { |point| {id: point.id, lat: point.lat, lng: point.lon, title: point.title} }
  end
  
  def permit_params(params)
    params.permit(:title, :lat, :lon, :altitude, :direction, :params)
  end
end
