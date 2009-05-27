# == Schema Information
# Schema version: 20080819151003
#
# Table name: page_views
#
#  id                   :integer(4)      not null, primary key
#  user_id              :integer(4)
#  request_uri          :string(255)     not null
#  request_method       :string(7)       not null
#  referer              :string(255)
#  session              :string(255)     not null
#  ip_address           :string(15)      not null
#  user_agent           :string(255)
#  http_accept          :string(255)
#  http_accept_language :string(255)
#  http_accept_encoding :string(255)
#  search_engine        :string(15)
#  search_terms         :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  deleted_at           :datetime
#

class Pageview < ActiveRecord::Base
  belongs_to :user
  
end
