class PagesController < ApplicationController
  def home
    @surfboards = Surfboard.all
    @carrousel_cards = Surfboard.last(10)
  end
end
