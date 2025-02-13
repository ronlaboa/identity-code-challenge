require_relative 'helpers'
require_relative 'validation_errors'
module IdentityRecordValidation

  # check if passport and national insurance number present
  module PassportAndNationalInsuranceValidation
    def self.validate_passport_and_national_insurance(identity_record)
      unless identity_record.key?('passportNumber') || identity_record.key?('nationalInsuranceNumber')
        Helpers.add_validation_error_to_array(identity_record, ValidationErrors::NO_PASSPORT_OR_NATIONAL_INSURANCE)
      end
      identity_record['passportNumber'].upcase! if identity_record.key?('passportNumber')
      identity_record
    end
  end
end
