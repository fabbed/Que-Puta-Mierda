class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  acts_as_commentable
  acts_as_taggable

  validates_presence_of   :body
  validates_length_of     :body,              :within => 40..10000
  validates_presence_of :category_id

  validates_length_of     :email,                   :within => 6..100
  validates_uniqueness_of :email,                   :case_sensitive => false

  named_scope :moderated, :conditions => ['on_startpage = ?', true]
  named_scope :tops, :conditions => ['on_startpage = ?', true]
  named_scope :flops, :conditions => ['on_startpage = ?', true]
  named_scope :to_moderate, :conditions => ['on_startpage = ?', true]  


end
