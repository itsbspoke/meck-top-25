require 'csv'
class CsvImporter

  def self.import_from_file(file)
    results = []
    importer = self.new
    CSV.foreach(file, headers: :first_row, return_headers: false, skip_blanks: true) do |row|
      result = importer.import_row(row)
      unless result.map{ |r| r.save }.reduce{ |all, this_one| all && this_one }
        Rails.logger.error("Error importing row: #{row}")
        Rails.logger.error(row.errors.full_messages.inspect)
      end
      results << result
    end
    results
  end

  def import_row(row)
    puts row
    who = Employee.find_or_create_by_name(row[0])
    what = Position.find_or_create_by_title(row[1])
    and_when = Employment.new(employee_id: who.id,
                              position_id: what.id,
                              salary: row[2].gsub(/[^0-9]/, "").to_i/100,
                              observation_date: Chronic.parse(row[3]))
    [who, what, and_when]
  end
  
end
