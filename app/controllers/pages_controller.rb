class PagesController < ApplicationController
  def home
    @presenter = HomePresenter.new(view_context)
  end
end
