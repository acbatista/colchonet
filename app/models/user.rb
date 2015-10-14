class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates_presence_of :email, :full_name, :location, :password
  validates_confirmation_of :password
  validates_lenght_of :bio, minimum: 30, allow_blank: false
  validate_uniqueness_of :email

  validate do
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    end
  end
end
