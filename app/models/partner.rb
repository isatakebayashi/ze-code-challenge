require 'rgeo/geo_json'

class Partner < ApplicationRecord
  validates :document, uniqueness: true

  def coverage_area=(val)
    location = geo_factory(val)
    write_attribute(:coverage_area, location.as_text)
  end

  def address=(val)
    location = geo_factory(val)
    write_attribute(:address, location.as_text)
  end

  def coverage_area
    RGeo::GeoJSON.encode(self[:coverage_area])
  end

  def address
    RGeo::GeoJSON.encode(self[:address])
  end

  private

  def geo_factory(val)
    geo_factory = RGeo::Geographic.simple_mercator_factory
    location = RGeo::GeoJSON.decode(val, geo_factory: geo_factory)
  end
end
