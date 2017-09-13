module DefaultPageContent
extend ActiveSupport::Concern

included do
  before_filter :set_page_default
end

#this may help to bring sartain data to a particular page and it helps with seo
def set_page_default
    @page_title = "Gustavo's Portfolio"
    @seo_keywords = "Gustavo Valenzuela Portfolio, Ruby, Ruby on Rails, Java Script, JS, CSS"
end


end








