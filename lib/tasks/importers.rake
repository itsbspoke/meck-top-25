namespace :import do
  desc "Import top 25 data"
  task :top_25 => :environment do
    employee_count, position_count, employment_count = [Employee, Position, Employment].collect{ |c| c.count }
    puts [employee_count, position_count, employment_count].inspect
    CsvImporter.import_from_file(File.join(Rails.root, "test/fixtures/top_25.csv"))
    new_employee_count, new_position_count, new_employment_count = [Employee, Position, Employment].collect{ |c| c.count }
    puts [new_employee_count, new_position_count, new_employment_count].inspect
  end
end
