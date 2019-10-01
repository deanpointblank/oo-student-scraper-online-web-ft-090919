require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    student_index = page.css("div.student-card")
    student_name = student_index.css("h4.student-name").text
    student_index.collect do |student|
      {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => student.css("a").attribute("href").text
      }
    end
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    binding.pry
    
  end

end

# name - student_index.css("h4.student-name").text
# location - student_index.css("p.student-location").text
# profile_url - student_index.css("a").attribute("href").text

# twitter = page.css("div.social-icon-container a")[0].attribute("href").text
# linkedin = page.css("div.social-icon-container a")[1].attribute("href").text
# github = page.css("div.social-icon-container a")[2].attribute("href").text
# blog =
# profile_quote = body > div.main-wrapper.profile > div.vitals-container > div.vitals-text-container > div
# bio = 