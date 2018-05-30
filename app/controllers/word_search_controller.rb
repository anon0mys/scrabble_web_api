class WordSearchController < ApplicationController
  def create
    @validation = WordSearchPresenter.new(params[:word_search])
    flash[:validation] = @validation.result
    redirect_to '/'
  end
end
