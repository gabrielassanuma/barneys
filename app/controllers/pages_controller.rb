class PagesController < ApplicationController
  def home
    @surfboards = Surfboard.all
  end
end
