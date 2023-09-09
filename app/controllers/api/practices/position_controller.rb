class Api::Practices::PositionController < ApplicationController
  def update
    @practice = Practice.find(params[:practice_id])
    if @practice.insert_at(params[:insert_at])
      head :no_content
    else
      render @practice.errors, status: :unprocessable_entity
    end
  end
end
