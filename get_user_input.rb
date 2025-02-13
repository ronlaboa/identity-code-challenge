require_relative 'identity_record_validation/file_utility'
require_relative 'identity_record_validation/first_name_validation'
require_relative 'identity_record_validation/last_name_validation'
require_relative 'identity_record_validation/date_of_birth_validation'
require_relative 'identity_record_validation/address_validation'
require_relative 'identity_record_validation/years_at_address_validation'
require_relative 'identity_record_validation/passport_and_national_insurance_validation'
require_relative 'identity_record_validation/validation_errors'
require 'active_support'

valid_records = []
invalid_records = []
@no_national_insurance_and_passport_count = 0
@years_at_address_less_than_five_years = 0
@people_with_more_than_two_first_names = 0

# parse xml file to hash
identity_records_hash = IdentityRecordValidation::FileUtility.parse_xml_to_hash('input/records.xml')


# puts identity_records_hash
# IdentityRecordValidation::FileUtility.write_hash_to_json('new_records.json', identity_records_hash)


# puts identity_records_hash['data']['people'].first
identity_records_hash['data']['people'].each do |identity|
  IdentityRecordValidation::FirstNameValidation.validate_first_name(identity)
  IdentityRecordValidation::LastNameValidation.validate_last_name(identity)
  IdentityRecordValidation::DateOfBirthValidation.validate_date_of_birth(identity)
  IdentityRecordValidation::AddressValidation.validate_address(identity)
  IdentityRecordValidation::YearsAtAddressValidation.validate_years_at_address(identity)
  IdentityRecordValidation::PassportAndNationalInsuranceValidation.validate_passport_and_national_insurance(identity)
  if identity.key?('validationErrorsArray')
    invalid_records << identity
  else
    valid_records << identity
  end
  if identity['firstNames'].split.length > 2
    puts identity['firstNames']
    @people_with_more_than_two_first_names += 1
  end
end

IdentityRecordValidation::FileUtility.write_records_to_json('output/valid_records.json', valid_records)
IdentityRecordValidation::FileUtility.write_records_to_json('output/invalid_records.json', invalid_records)


# iterate over the invalid records to find out how many have no passport and no national insurance number
invalid_records.each do |record|
  if record['validationErrorsArray'].include? IdentityRecordValidation::ValidationErrors::NO_PASSPORT_OR_NATIONAL_INSURANCE
    @no_national_insurance_and_passport_count += 1
  end

  # iterate over the invalid records to find out how many have no passport and no national insurance number
  if record['validationErrorsArray'].include? IdentityRecordValidation::ValidationErrors::YEARS_AT_ADDRESS_MAX_LENGTH
    @years_at_address_less_than_five_years += 1
  end
end

puts "Valid records stored in output/valid_records.json"
puts "Invalid records stored in output/invalid_records.json"
puts "Number of records without a national number or passport: #{@no_national_insurance_and_passport_count}"
puts "Number of records with years add address less than 5 years: #{@years_at_address_less_than_five_years}"
puts "Number of records with more than two first names: #{@people_with_more_than_two_first_names}"


