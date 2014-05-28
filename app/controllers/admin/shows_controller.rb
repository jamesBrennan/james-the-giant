class Admin::ShowsController < ApplicationController
  layout "admin"
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  def index
    @shows = Show.all
  end

  def show
  end

  def new
    @show = Show.new
  end

  def edit
  end

  def create
    @show = Show.new(show_params)

    if @show.save
      redirect_to @show, notice: 'Show was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @show.update(show_params)
      redirect_to @show, notice: 'Show was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @show.destroy
    redirect_to shows_url, notice: 'Show was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def show_params
      params.require(:show).permit(:date, :city, :state, :link)
    end
end
