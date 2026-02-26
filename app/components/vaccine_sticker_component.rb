class VaccineStickerComponent < ViewComponent::Base
  def initialize(vaccine:)
    @vaccine = vaccine
  end
end
