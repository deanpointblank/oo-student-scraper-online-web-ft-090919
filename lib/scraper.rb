require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    student_index = page.css("div.student-card")
    binding.pry
    student_index.collect do |student|
      student.text
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# name
# location
# profile_url 

