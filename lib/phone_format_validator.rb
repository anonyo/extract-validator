class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ PhoneRegex::FORMAT
      object.errors[attribute] << (options[:message] || "formatting is invalid")
    end
  end
end
