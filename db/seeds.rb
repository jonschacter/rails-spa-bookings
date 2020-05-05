# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spa1 = Spa.create(name: "Oceania Spa", 
                    address1: "1325 Scallop Way", 
                    address2: "Ste 522", 
                    city: "Pacific Beach", 
                    state: "CA", 
                    zip: "92109", 
                    phone_number: "(135) 790-2468"
                )
spa2 = Spa.create(name: "The Tuileries",
                    address1: "2643 Royal Ct",
                    city: "Boston",
                    state: "MA",
                    zip: "02115",
                    phone_number: "(246) 801-3579"
                )

marie = Technician.create(name: "Marie Lowell")
abigail = Technician.create(name: "Abigail Proofrock")
amanda = Technician.create(name: "Amanda Baylor")
alistor = Technician.create(name: "Alistor Bingham")

spa1.technicians = [marie, abigail]
spa2.technicians = [amanda, alistor]

treat1 = Treatment.create(name: "Aromatherapy Massage",
                            description: "Boost your mood, reduce stress and anxiety with this gentle pressure massage that focuses on development and use of essential oils.",
                            price: "100",
                            duration: 60
                        )

treat2 = Treatment.create(name: "Swedish Massage",
                            description: "This gentle full body massage focuses on relieving tension, and increasing blood flow using long flowing strokes.",
                            price: "80",
                            duration: 60
                        )

treat3 = Treatment.create(name: "Classic Facial",
                            description: "Here we steam the face, exfoliate, extract, massage and moisturize. The perfect introduction to facials.",
                            price: "85",
                            duration: 30
                        )

treat4 = Treatment.create(name: "Microdermabrasion",
                        description: "Focusing on exfoliation, this facial uses our special diamond-tip brush to remove dead skin cells.",
                        price: "99.99",
                        duration: 30
                    )

spa1.treatments = [treat1, treat3]
spa2.treatments = [treat2, treat4]

jon = User.create(email: "jon@test.com", password: "password", name: "Jon Schacter")

appointment1 = Appointment.new(appointment_time: DateTime.new(2020, 6, 30, 14))
appointment1.user = jon
appointment1.treatment = treat2
appointment1.technician = amanda
appointment1.save