require "spec_helper"

describe PhoneFormatValidator do
  describe "#validate_each" do
    it 'adds an error if a phone number formatting is incorrect' do

      invalid_person = Person.new(phone_number: '++7777-777-777')
      PhoneFormatValidator.new(attributes: :phone_number).validate(invalid_person)

       expect(invalid_person.errors.full_messages).to eq [
        "Phone number formatting is invalid"
      ]
    end
     it 'validates with correct phone number formatting' do

      valid_person = Person.new(phone_number: '7777777777')
      PhoneFormatValidator.new(attributes: :phone_number).validate(valid_person)

       expect(valid_person).to be_valid
    end
  end
end
