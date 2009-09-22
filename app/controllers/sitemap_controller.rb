class SitemapController < ApplicationController

def xml
    @stories = Story.newest_first    

    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = @stories[0].updated_at.httpdate  
    render :layout => false
end


end
