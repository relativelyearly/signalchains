class TagsController < ApplicationController
  def show
    @chains = Chain.complete.find_tagged_with(params[:id]).paginate(:page => params[:page], :per_page => 10)
  end
end