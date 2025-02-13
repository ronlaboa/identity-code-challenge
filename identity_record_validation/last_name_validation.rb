require_relative 'helpers'
require_relative 'validation_errors'
module IdentityRecordValidation
  module LastNameValidation
    # validate last name check if over 45 characters and no invalid characters
    def self.validate_last_name(identity_record)
      Helpers.add_validation_error_to_array(identity_record, ValidationErrors::LAST_NAME_MAX_LENGTH) if identity_record['lastName'].length > 45
      Helpers.add_validation_error_to_array(identity_record, ValidationErrors::LAST_NAME_MAX_INVALID_CHARACTERS) if identity_record['lastName'] !~ /\A[-'A-Z\s]+\z/i
      identity_record['lastName'] = identity_record['lastName'].titleize
      identity_record
    end
  end
end
