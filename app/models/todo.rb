class Todo < ApplicationRecord      ## will be ActiveRecord::Base in older Rails versions
  validates :name, presence: true, length: { maximum: 200 }

  def required_field?(field)  ## pass field name
    presence_validators = validators(field, ActiveRecord::Validations::PresenceValidator)
    !presence_validators.empty?
  end

  def length_val(field, minmax)  ## pass field name and which value i.e. :name, :maximum)
    length_validators = validators(field, ActiveRecord::Validations::LengthValidator)
    return nil if length_validators.empty?
    length_validators.first.options[minmax]
  end

  private
  def validators(field, val_class)  ## pass field name and the validator class to check
    _validators[field].select do |e|
      e.is_a? val_class
    end
  end

end
