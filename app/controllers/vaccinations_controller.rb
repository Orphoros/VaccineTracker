class VaccinationsController < ApplicationController
  def index
    @vaccinations = Vaccination.all
  end

  def pdf
    vaccinations = Vaccination.all

    pdf = Pdfs::AllVaccinationsPdf.new(vaccinations).render

    send_data pdf,
      filename: "vaccination-cards.pdf",
      type: "application/pdf",
      disposition: "inline"
  end
end
