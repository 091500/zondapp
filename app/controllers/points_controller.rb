class PointsController < ApplicationController
  def index
    @points = Point.all.to_a
  end
  
  def json
    render json: prepare_points_for_google(Point.all.to_a)
  end
  
  private
  
  def prepare_points_for_google(points)
    points.map { |point| {id: point.id, lat: point.lat, lng: point.lon, title: point.title} }
  end
end
