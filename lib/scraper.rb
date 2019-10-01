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
    profile = {}
    profile[:profile_quote] = page.css("div.profile-quote").text
    profile[:bio] = page.css("div.description-holder p").text
      page.css("div.social-icon-container a").each do |social|
        case social.attribute("href").text
          when social.attribute("href").text.include?("twitter")
            profile[:twitter] = social.attribute("href").text
          when social.attribute("href").text.include?("linkedin")
            profile[:linkedin] = social.attribute("href").text
          when social.attribute("href").text.include?("github")
            profile[:github] = social.attribute("href").text
          else
            profile[:blog] = social.attribute("href").text
        end
        #binding.pry
      end
    profile
  end

end

# name - student_index.css("h4.student-name").text
# location - student_index.css("p.student-location").text
# profile_url - student_index.css("a").attribute("href").text

# :twitter => page.css("div.social-icon-container a")[0].attribute("href").text,
# :linkedin => page.css("div.social-icon-container a")[1].attribute("href").text,
# :github => page.css("div.social-icon-container a")[2].attribute("href").text,
# :blog => page.css("div.social-icon-container a")[3].attribute("href").text,
# :profile_quote => page.css("div.profile-quote").text,
# :bio => page.css("div.description-holder p").text