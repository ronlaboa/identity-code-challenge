require_relative 'helpers'
require_relative 'validation_errors'
module IdentityRecordValidation

  # check a user has lived ad address for longer than 5 years
  module YearsAtAddressValidation
    def self.validate_years_at_address(identity_record)
      Helpers.add_validation_error_to_array(identity_record, ValidationErrors::YEARS_AT_ADDRESS_MAX_LENGTH) if identity_record['yearsAtAddress'] < 5
      identity_record
    end
  end
end
