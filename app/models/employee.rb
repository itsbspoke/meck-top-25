class Employee < ActiveRecord::Base

  has_many :employments  #  opposite: belongs_to
  has_many :positions, :through => :employments 
 
  #has_many, :through =>
  #involves AT LEAST another association and probably another database table.

  def first_name
    name.partition(',').last
  end

  def lifetime_salary
    employments.sum(:salary)
  end

  def self.highest_rollers
    employees = self.all
    employees.sort_by{ |e| e.lifetime_salary }.reverse[0,9]
  end
end

