require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    student_index = page.css("div.student-card")
    students = student_index.collect do |student|
      student
    end
    binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# name - student_index.css("h4.student-name")[0].text
# location - student_index.css("p.student-location")[0].text
# profile_url 

#ryan-johnson-card > a