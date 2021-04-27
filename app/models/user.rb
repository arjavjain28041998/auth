class User < ApplicationRecord
  has_secure_password
  # validate :password_lower_case
  # validate :password_uppercase
  # validate :password_special_char
  # validate :password_contains_number
  validates :email ,uniqueness: true
  validates :name ,uniqueness: true

  # def password_uppercase
  #   return if !!password.match(/\p{Upper}/)
  #   errors.add :password, ' must contain at least 1 uppercase '
  # end

  # def password_lower_case
  #   return if !!password.match(/\p{Lower}/)
  #   errors.add :password, ' must contain at least 1 lowercase '
  # end

  # def password_special_char
  #   special = "?<>',?[]}{=-)(*&^%$#`~{}!@"
  #   regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
  #   return if password =~ regex
  #   errors.add :password, ' must contain special character'
  # end

  # def password_contains_number
  #   return if password.count("0-9") > 0
  #   errors.add :password, ' must contain at least one number'
  # end
  def send_password_reset
 	 generate_token(:password_reset_token)
  	 self.password_reset_sent_at = Time.zone.now
  	save!
  UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
end
# This generates a random password reset token for the user
def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end
end
