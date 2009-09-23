class NewsletterRegistration < ActiveRecord::Base

  validates_presence_of   :email
  validates_length_of     :email,                   :within => 6..100
  validates_format_of     :email,                   :with => EMAILADDRESS
  validates_uniqueness_of :email


end
