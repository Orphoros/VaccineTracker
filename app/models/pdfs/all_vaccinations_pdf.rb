require "prawn"

module Pdfs
  class AllVaccinationsPdf < Prawn::Document
    def initialize(vaccinations)
      super(top_margin: 50)

      text "My Vaccinations", size: 24, style: :bold
      move_down 20

      table_data = Array.new
      table_data << [ "Vaccine", "Vaccinated At", "Expires At", "Batch Number", "Dose", "Booster", "Brand" ]
      vaccinations.each do |vaccination|
        v = vaccination.vaccines.first
        table_data << [
          v.name,
          vaccination.received_at.strftime("%B %d, %Y"),
          v.expiration_date_str,
          v.batch_number,
          "#{v.dose} ml",
          v.is_booster ? "Yes" : "No",
          v.brand
        ]
      end
      table(table_data, header: true, row_colors: [ "F0F0F0", "FFFFFF" ], width: bounds.width) do
        row(0).font_style = :bold
        columns(0..2).align = :center
      end
    end
  end
end
