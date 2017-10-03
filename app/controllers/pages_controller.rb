class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skills = Skill.all
  end

  def about
    @skills= Skill.all
  end

  def contact
  end


  def tec_news
    @twitts = SocialTool.twitter_search
  end
end
