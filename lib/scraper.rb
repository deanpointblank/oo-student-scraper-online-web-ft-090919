require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    student_index = page.css("div.student-card")
    student_name = student_index.css("h4.student-name").text
    students = []
    student_index.each do |student|
       students << student_name.to_sym = {
        :name => student_index.css("h4.student-name").text,
        :location => student_index.css("p.student-location").text,
        :profile_url => student_index.css("a").attribute("href").text
      }
    end
    students
    #       binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# name - student_index.css("h4.student-name").text
# location - student_index.css("p.student-location").text
# profile_url - student_index.css("a").attribute("href").text

#ryan-johnson-card > a