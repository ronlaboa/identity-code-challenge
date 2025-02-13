require_relative 'helpers'
require_relative 'validation_errors'
require 'active_support'

module IdentityRecordValidation
  module AddressValidation
    # validate user address to check if postcode and line1 present
    # if line is not present attempt tp build it from the 'buildingNumber', 'streetName' and 'town'
    def self.validate_address(identity_record)

      if identity_record.key?('address') && identity_record['address'].key?('postcode')

        # At this point we know an address exists and has a postcode so now we can check for line one
        unless identity_record.key?('line1')

          # We can now check for the other address fields to attempt to build lone 1 of the address
          if identity_record['address'].key?('buildingNumber') && identity_record['address'].key?('streetName') && identity_record['address'].key?('town')
            identity_record['address']['line1'] = "#{identity_record['address']['buildingNumber']} #{identity_record['address']['streetName']} #{identity_record['address']['town']}"
          else
            Helpers.add_validation_error_to_array(identity_record, ValidationErrors::ADDRESS_INVALID)
          end
          identity_record
        end
      else
        Helpers.add_validation_error_to_array(identity_record, ValidationErrors::ADDRESS_INVALID_NO_POSTCODE)
      end
      identity_record
    end
  end
end
