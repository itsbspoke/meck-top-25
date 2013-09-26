class Employment < ActiveRecord::Base

  belongs_to :employee
  belongs_to :position

  def self.highest_annual
    order("salary desc").limit(10)
  end

end
