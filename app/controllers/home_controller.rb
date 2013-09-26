class HomeController < ApplicationController
  def index
    @top_10_annual = Employment.highest_annual
    @top_10_lifetime = Employee.highest_rollers
  end
end
