module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'DevcampPortfolio | Matthew Hopwood'
    @seo_keywords = 'Matthew Hopwood portfolio'
  end
end
