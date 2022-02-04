class Todo < ApplicationRecord      ## will be ActiveRecord::Base in older Rails versions
  validates :name, presence: true, length: { maximum: 200 }

  def length_val(field, minmax)  ## pass field name and which value i.e. :name, :maximum)
    length_validators = _validators[field].select do |e|
      e.is_a? ActiveRecord::Validations::LengthValidator
    end
    return nil if length_validators.empty?
    length_validators.first.options[minmax]
  end

end
