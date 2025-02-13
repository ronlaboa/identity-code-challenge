module IdentityRecordValidation
  module ValidationErrors
    FIRST_NAME_MAX_LENGTH = 'First name is over 45 characters'.freeze
    FIRST_NAME_MAX_INVALID_CHARACTERS = 'First name has invalid characters'.freeze
    LAST_NAME_MAX_LENGTH = 'Last name is over 45 characters'.freeze
    LAST_NAME_MAX_INVALID_CHARACTERS = 'Last name has invalid characters'.freeze
    DATE_OF_BIRTH_UNDER_EIGHTEEN = 'Date of birth is under 18 uears old'.freeze
    ADDRESS_INVALID = 'Could not determine address line1'.freeze
    ADDRESS_INVALID_NO_POSTCODE = 'Address has no postcode or address is empty'.freeze
    YEARS_AT_ADDRESS_MAX_LENGTH = 'years at address less than 5 years'.freeze
    NO_PASSPORT_OR_NATIONAL_INSURANCE = 'Both Passport and National Insurance number are not present'.freeze
  end
end
