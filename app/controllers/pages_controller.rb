class PagesController < ApplicationController
  def home
    @surfboards = Surfboard.all
    @carousel_cards = Surfboard.last(10)
  end
end
