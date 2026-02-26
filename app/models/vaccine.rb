class Vaccine < ApplicationRecord
  validates :name, presence: true
  validates :dose, presence: true, numericality: { greater_than: 0, less_than: 5 }
  belongs_to :vaccination

  def is_lifelong?
    return false if vaccination.nil? || days_valid.nil?

    days_valid >= (100 * 365.25).to_i
  end

  def expired?
    return true if vaccination.nil? || days_valid.nil?

    base_date = vaccination.received_at
    expiration_date = base_date + days_valid.days

    Date.today > expiration_date
  end

  def expiration_date_str
    return "Never" if vaccination.nil? || days_valid.nil?

    (vaccination.received_at + days_valid.days).strftime("%B %d, %Y")
  end

  def validity_in_years_str
    return Float::INFINITY if vaccination.nil? || days_valid.nil?

    years = ((expiration_date - vaccination.received_at.to_date).to_i / 365.25).round(0)

    if years == 0
      return "Only with booster"
    end

    years >= 100 ? "Always" : years < 2 ? "#{years} year" : "#{years} years"
  end

  def expiration_date
    return nil if vaccination.nil? || days_valid.nil?

    vaccination.received_at + days_valid.days
  end
end
