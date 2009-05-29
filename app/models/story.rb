class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  acts_as_commentable
  acts_as_taggable

  validates_presence_of   :body
  validates_length_of     :body,              :within => 40..10000
  validates_presence_of :category_id

  named_scope :moderated, :conditions => ['on_startpage = ?', true]
  named_scope :tops, :order => ['rated_top desc']
  named_scope :flops, :order => ['rated_flop desc']
  named_scope :newest_first, :order => ['created_at desc']
  named_scope :to_moderate, :conditions => ['on_startpage = ?', true]  
  
  has_friendly_id :seo_title, :use_slug => true, :strip_diacritics => true
  
  before_validation :generate_seo_title




  def generate_seo_title
    if self.title.length > 30
      self.seo_title = self.title
    else
      self.seo_title = self.body[0..(60+ (self.body[60..100].index(" ")))]          
    end
  end



  def browser_title
    self.seo_title
  end


  # def to_param
  #   "#{id}-#{body[0..60].gsub(/[^a-z0-9]+/i, '-')}"
  # end




end
