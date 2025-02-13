require 'active_support/core_ext/hash'
require 'json'
module IdentityRecordValidation
  module FileUtility
    def self.parse_xml_to_hash(file)
      begin
        hash = Hash.from_xml(File.read(file))
      rescue StandardError
        raise IOError
      end
      hash
    end

    def self.write_records_to_json(file, hash)
      begin
        File.open(file, 'w') do |f|
          f.write(hash.to_json)
        end
      rescue StandardError
        raise IOError
      end
    end
  end
end
