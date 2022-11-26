class Public::HomesController < ApplicationController

  def top
    @industries = Industry.all
  end
end
