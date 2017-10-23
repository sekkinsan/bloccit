class User < ApplicationRecord
    #register inline callback directly after before_save callback
    before_save { self.email = email.downcase if email.present? }

    #use Ruby's validates function to ensure name is present with a maximum and minimuml ength
    validates :name, length: { minimum: 1, maximum: 100}, presence: true

    #validate password with two separate validations
        #ensure that when we create a new user, they have a valid password
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
        #ensure that when updating a user's password, updated password is also six characters long
    validates :password, length: { minimum: 6 }, allow_blank: true

    #validate that email is present, unique, case insensitive, has minimum and maximum length, and properly formatted
    validates :email,
              presence: true,
              uniqueness: { case_insensitive: false },
              length: { minimum: 3, maximum: 254 }

    #user Ruby's has_secure_password which adds methods to set and authenticate against a BCrypt password
    has_secure_password
end