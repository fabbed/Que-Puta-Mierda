class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  acts_as_commentable
  acts_as_taggable

  validates_presence_of   :body
  validates_length_of     :body,              :within => 1..100
  validates_presence_of :category_id

  validates_length_of     :email,                   :within => 6..100
  validates_format_of     :email,                   :with => Authentication.email_regex, :message => Authentication.bad_email_message
  validates_uniqueness_of :email,                   :case_sensitive => false


end
