class WordSearchController < ApplicationController
  def create
    @validation = WordValidator.new(params[:word_search])
    redirect_to '/'
  end
end
