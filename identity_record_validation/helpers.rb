module IdentityRecordValidation
  module Helpers

    # creates an array to store errors
    def self.add_validation_error_to_array(identity_record, error)
      identity_record['validationErrorsArray'] ||= []
      identity_record['validationErrorsArray'] << error
      identity_record
    end
  end
end
