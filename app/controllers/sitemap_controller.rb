class SitemapController < ApplicationController

def xml
  @headers = Hash.new
  @headers['Content-Type'] = "application/xml"
  @stories = Story.newest_first
  render :layout => false
end


end
