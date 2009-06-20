class Event < ActiveRecord::Base
  UK_POSTCODE_REGEXP = /([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)/

  belongs_to :owner, :class_name => "User"

  validates_presence_of :lat, :lng

  acts_as_mappable
  before_validation_on_create :geocode_address

  named_scope :within_distance_in_miles, lambda{ |origin, distance_in_miles|
    distance_sql = self.distance_sql(origin)
    { :select => "*, #{distance_sql} as distance",
      :conditions => "#{distance_sql} <= #{distance_in_miles}",
      :order => 'distance asc'
    }
  }

  named_scope :limit, lambda{ |limit|
    { :limit => limit }
  }

  def geocode_address
    unless lat && lng
      geo = GeoKit::Geocoders::MultiGeocoder.geocode(address)
      if geo.success
        self.lat, self.lng = geo.lat, geo.lng
      else
        address =~ UK_POSTCODE_REGEXP
        postcode = $1
        if postcode
          geo = GeoKit::Geocoders::MultiGeocoder.geocode(postcode)
          if geo.success
            self.lat, self.lng = geo.lat, geo.lng
          else
            errors.add(:address, "Could not geocode address")
          end
        else
          errors.add(:address, "Could not geocode address")
        end
      end
    end
  end
end
