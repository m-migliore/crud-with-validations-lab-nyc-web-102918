class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.new.year}, if: :released?

  def released?
    self.released
  end

  def valid_release_year?
    self.released? && self.valid_year?
  end

end
