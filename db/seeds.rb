# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Doctor.create([{
  name: "Dr. Chatterjee",
  specialism: "Neurosurgon",
  cost: 2000
},
{
    name: "Dr. Mahli",
    specialism: "Cardiologist",
    cost: 1800
}])

Patient.create([{
    patient_name: "Ram",
    phone_number: "+918420368379"
    },
{
    patient_name: "Shyam",
    phone_number: "+917980815681"
}])

