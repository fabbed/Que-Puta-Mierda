class CreateVisitorSessions < ActiveRecord::Migration
  def self.up
    create_table :visitor_sessions do |t|
      t.belongs_to :visitor
      t.string     :ip,           :limit => 15, :null => false
      t.string     :session_id,   :null => false
      t.string :user_agent
      t.string :referer
      t.integer :pageviews,       :default => 1
      
      t.text    :stories
      t.text    :comments
      t.text    :ratings
      t.text    :recommendations
      
      t.string     :request_method,       :limit => 7, :null => false
      t.string     :user_agent
      t.string     :http_accept_language
      t.timestamps

    end
  end

  def self.down
    drop_table :visitor_sessions
  end
end
