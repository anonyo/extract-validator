class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ PhoneRegex::FORMAT
      object.errors[attribute] << (options[:message] || "invalid phone number formatting")
    end
  end
end
