class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContentConcern

  before_action :set_copyright

  def set_copyright
    @copyright = MTalkViewTool::Renderer.copyright 'Mateusz Talkowski', 'All rights reserved'
  end
end

module MTalkViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
