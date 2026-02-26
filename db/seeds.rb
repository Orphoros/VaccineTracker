Vaccine.destroy_all
Vaccination.destroy_all

vaccinations = Vaccination.create!([
  { received_at: Date.new(2001, 1, 10) },
  { received_at: Date.new(2005, 1, 5) },

  { received_at: Date.new(2017, 5, 6) },
  { received_at: Date.new(2017, 5, 16) },

  { received_at: Date.new(2026, 2, 5) },
  { received_at: Date.new(2026, 2, 10) },
  { received_at: Date.new(2026, 2, 21) }
])

Vaccine.create!([
  { vaccination: vaccinations[0], brand: "Revaxis", batch_number: "Y38DGT4", dose: 0.5, is_booster: false,  name: "DTP", days_valid: 1825 },
  { vaccination: vaccinations[1], brand: "Revaxis", batch_number: "Y67FGT2", dose: 0.5, is_booster: true,  name: "DTP", days_valid: 3650 },

  { vaccination: vaccinations[2], brand: "Silgard", batch_number: "AHBV496", dose: 0.5, is_booster: false,  name: "HPV", days_valid: 1825 },
  { vaccination: vaccinations[3], brand: "Silgard", batch_number: "AHBV793", dose: 0.5, is_booster: true,  name: "HPV", days_valid: 3650 },

  { vaccination: vaccinations[4], brand: "Rabix-vc",  batch_number: "R89TXT6", dose: 0.5, is_booster: false, name: "Rabies", days_valid: 1 },
  { vaccination: vaccinations[5], brand: "Avaxim",  batch_number: "YS74XX3", dose: 0.5, is_booster: false, name: "Hepatitis A", days_valid: 3650 },
  { vaccination: vaccinations[6], brand: "Rabix-vc",  batch_number: "R89TXT9", dose: 0.5, is_booster: true, name: "Rabies", days_valid: 36525 }

])

p "Seeded #{Vaccine.count} vaccines and #{Vaccination.count} vaccinations."
