# ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| "<span class=\"fieldWithErrors\">#{html_tag}</span>" }

if ENV["RAILS_ENV"] == "development"
  GOOGLE_MAPS_API_KEY='ABQIAAAAkzCpk0J1FPlWiSinzJS-6hStOmsjZgxxXrUogWOFOYQnWe6ixRRZTwqxwqGexV9P5RUAHoyvU99zMw'
elsif ENV["RAILS_ENV"] == "production"
  #for testing.konauto.com
  GOOGLE_MAPS_API_KEY='ABQIAAAAq41jgnMAVw_fZQq0XgCgOxQNz90eL7hIqj1cU5yUw8Or6OIAHhRtKtjjSxXP2IEtg01bz8-2eerw3A'  
end

TRIP_DATEPICKER_YEAR_FROM = Time.now.strftime('%Y').to_i
TRIP_DATEPICKER_YEAR_TO = Time.now.strftime('%Y').to_i + 1
USER_DATEPICKER_YEAR_FROM = 100.years.ago.year
USER_DATEPICKER_YEAR_TO = 14.years.ago.year
USER_YEAR_RANGE = "'-100:-14'"
TRIP_YEAR_RANGE = "'+00:+01'"

SEAT_OPTIONS = [1, 2, 3, 4, 5, 6]
DRIVING_STYLE_OPTIONS  = [[ "Gemütlich", :slow ], [ "Normal", :normal ], [ "Sportlich", :fast ]]

SEARCH_RADIUS_OPTIONS         = ["0", "10", "20", "30", "40", "50", "60"]
SEARCH_DATE_TOLERANCE_OPTIONS = ["0", "1", "2", "3", "4"]
SEARCH_DATE_TOLERANCE_OPTIONS_STARTPAGE= {"0 Tage" => "0", "1 Tag" => "1", "2 Tage" => "2", "3 Tage" => "3", "4 Tage" => "4"}
SEARCH_TIME_TOLERANCE_OPTIONS = ["0", "1", "2", "3", "4", "5", "6"]
SEARCH_SEATS_OPTIONS          = ["1", "2", "3", "4", "5", "6"]
SEARCH_DRIVING_STYLE_OPTIONS  = DRIVING_STYLE_OPTIONS + [["Egal", ""]]

RATINGS_SCORE = [[ "Negativ", -1 ],[ "Normal", 0 ],[ "Positiv", 1 ]]

LOCALES = [[ "Deutsch", "de-DE" ],[ "English", "en-US" ]]

PAYMENT_OPTIONS = [["SMS", "sms"], ["Gutschein", "voucher"]]


NEW_TRIP_PRICE_FIELD_SIZE = 4
NEW_TRIP_CITY_FIELD_SIZE = 17
SEATS_FIELD_SIZE = 2
DURARION_FIELD_SIZE = 5
HIGHLIGHT_DURATION = 2

AUTO_TRIPS_HELPER = true
