class PointsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook_create]
  before_action :get_titles, except: [:webhook_create, :destroy]
  
  def index
    permitted_params = permit_params(params)
    requested_title = permitted_params[:title]
    title = @titles.include?(requested_title) ? requested_title : @titles.first
    
    @selected_title = title
    @points = Point.where(title: title).to_a
    @point = Point.new
  end
  
  def create
    point = Point.create(permit_params(params))
    point.save!
    
    redirect_to points_path
  end

  def search
    permitted_params = permit_params(params)
    requested_title = permitted_params[:title]
    title = @titles.include?(requested_title) ? requested_title : @titles.first
    
    redirect_to action: 'index', title: title
  end
  
  def webhook_create
    point = Point.create(permit_webhook_params(params))
    point.save!
    
    render body: nil
  end
  
  def destroy
    Point.destroy(params[:id])
    
    redirect_to points_path
  end
  
  def json
    permitted_params = permit_params(params)
    requested_title = permitted_params[:title]
    title = @titles.include?(requested_title) ? requested_title : @titles.first
    points = Point.where(title: title).to_a
    
    render json: {points: prepare_points_for_google(points)}
  end
  
  private
  
  def get_titles
    @titles = Point.all.pluck(:title).uniq.to_a
  end
  
  def prepare_points_for_google(points)
    points.map do |point| 
      {
        id: point.id, 
        lat: point.lat, 
        lng: point.lon, 
        title: point.title, 
        altitude: point.altitude, 
        direction: point.direction
      } 
    end
  end
  
  def permit_params(params)
    params.permit(:title)
  end
  
  def permit_webhook_params(params)
    params.require(:point).permit(:title, :lat, :lon, :altitude, :direction, :params)
  end
end
