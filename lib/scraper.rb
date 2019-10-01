require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    student_index = Nokogiri::HTML(open(index_url))
    binding.pry
    student_index.css("div.student-card")
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# name
# location
# profile_url 

