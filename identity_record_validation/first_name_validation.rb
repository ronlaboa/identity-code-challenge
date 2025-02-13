require_relative 'helpers'
require_relative 'validation_errors'
module IdentityRecordValidation
  module FirstNameValidation

    # validate first name check if over 45 characters and no invalid characters
    def self.validate_first_name(identity_record)
      Helpers.add_validation_error_to_array(identity_record, ValidationErrors::FIRST_NAME_MAX_LENGTH) if identity_record['firstNames'].length > 45
      Helpers.add_validation_error_to_array(identity_record, ValidationErrors::FIRST_NAME_MAX_INVALID_CHARACTERS) if identity_record['firstNames'] !~ /\A[-'A-Z\s]+\z/i
      identity_record['firstNames'] = identity_record['firstNames'].titleize
      identity_record
    end
  end
end
