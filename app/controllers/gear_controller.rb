class GearController < ApplicationController
  def index
    respond_to do |format|
      format.html {render 'gear/gear_index'}
    end
  end
end