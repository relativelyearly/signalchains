class SearchesController < ApplicationController
  def index
  end

  def show
    @search = Search.new(:keyword => params[:id], :page => params[:page])
  end

  def gear
    @search = Search.new(:keyword => params[:id], :page => params[:page])
  end

  def users
    @search = Search.new(:keyword => params[:id], :page => params[:page])
  end

  def chains
    @search = Search.new(:keyword => params[:id], :page => params[:page])
  end

  def create
    respond_to do |format|
      format.html { redirect_to :action => :show, :id => params[:search][:keyword] }
    end
  end

  def update
    respond_to do |format|
      format.html { redirect_to :action => :show, :id => params[:search][:keyword] }
    end
  end
end