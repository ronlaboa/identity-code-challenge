# identity-code-challenge
A solution to validate and store identity records

# Running the validator

To run the validator in terminal 

`gem install activesupport`
`gem install adroit-age`

`ruby validate_identity.rb`

This will output the valid records to 'output/valid_records.json'
This will output the invalid records to 'output/invalid_records.json'