class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end
  def show
    # @poem = Poem.find(:all, :params => {:id => params[:id]})
    @poem = Poem.find(params[:id])
  end
end
