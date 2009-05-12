class AddSeoTitleToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :seo_title, :string

    Story.all.each do |story|
      story.seo_title = story.body[0..(60+ (story.body[60..100].index(" ")))]
      story.save
    end

  end


  def self.down
    remove_column :stories, :seo_title
  end
end
