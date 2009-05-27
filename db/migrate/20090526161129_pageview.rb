class Pageview < ActiveRecord::Migration
  def self.up
    create_table :pageviews do |t|
      t.belongs_to :user
      t.string     :request_uri,          :null => false
      t.string     :request_method,       :limit => 7, :null => false
      t.string     :referer
      t.string     :session,              :null => false
      t.string     :ip_address,           :limit => 15, :null => false
      t.string     :user_agent
      t.string     :http_accept
      t.string     :http_accept_language
      t.string     :http_accept_encoding
      t.string     :search_engine,        :limit => 15
      t.string     :search_terms
      t.timestamps
    end
    
    add_index :pageviews, :user_id
    add_index :pageviews, :session
    add_index :pageviews, :ip_address
  end
  
  def self.down
    drop_table :pageviews
  end
end


