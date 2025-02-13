require_relative 'helpers'
require_relative 'validation_errors'
require 'active_support'
require 'adroit-age'

module IdentityRecordValidation
  module DateOfBirthValidation

    # Get the users age and if under eighteen add error to array
    def self.validate_date_of_birth(identity_record)
      dob = identity_record['dateOfBirth'].to_date
      age = dob.find_age
      Helpers.add_validation_error_to_array(identity_record, ValidationErrors::DATE_OF_BIRTH_UNDER_EIGHTEEN) if age < 18
      identity_record
    end
  end
end
