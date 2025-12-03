class ModelsController < ApplicationController
  def index
    Rails.application.eager_load!
    @descendants = ApplicationRecord.descendants
  end

  def show
    Rails.application.eager_load!
    @descendants = ApplicationRecord.descendants
    @current_model = @descendants.select { |m| m.to_s == params['model_name'] }.first
    @current_model.load_schema
  end
end
