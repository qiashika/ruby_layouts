namespace :create_csv do
    require 'csv'
    task :export => :environment do
        table = Doctor.all
        CSV.open("Doctor.csv",'w',write_headers: true,headers: ["ID","Name"]) do |csv|
            table.each do |doctor|
                csv<< [doctor.id, doctor.name]
            end
        end
    end


end
