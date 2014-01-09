module JsonApi
  extend ActiveSupport::Concern

  included do
  end

  def index
    render json: collection
  end

  def show
    render json: resource
  end

  def create
    render json: collection.create!(resource_params)
  end

  def update
    render json: resource.update!(resource_params)
  end

  def destroy
    render json: resource.destroy
  end

  private

  def resource_class_name
    @resource_class_name ||= self.class.name.sub('Controller', '').singularize
  end

  def resource_class
    @resource_class ||= resource_class_name.constantize
  end

  def resource
    @resource ||= resource_class.find(params[:id])
  end

  def collection
    resource_class.all
  end

  def resource_params
    excluded = ['id', 'created_at', 'updated_at']
    attr_names = resource_class.attribute_names - excluded
    params.require(resource_class_name.underscore).permit(*attr_names)
  end

  module ClassMethods
  end
end
