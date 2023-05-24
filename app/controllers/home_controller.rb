require 'buttercms-ruby'
ButterCMS::api_token = ENV["BUTTER_API_TOKEN"]

class HomeController < ApplicationController
  def search()
    search = params[:query]
    p search
    if search
      listData = ButterCMS::Page.search(search, {
        page_type: 'kb_article_type'
      });

      if listData.items.empty?
        # Do something if my_array is empty
        listData = ButterCMS::Page.search(search, {
          page_type: 'kb_section_type'
        });
        # @listData = listData
        if listData.items.empty?
          redirect_to '/section/' + 'not-found'
          session[:queryValue] = search
        else
          redirect_to '/section/' + listData.items[0].data.slug
        end
      else
        # Do something if my_array is not empty
        @listData = listData.items
      end

      p listData

     else
      @listData = []
    end
  end
  
  def index
    homeData = ButterCMS::Page.get('*', "kb-homepage")
    @homeData = homeData.data
    # p homeData.data

    search()

    rescue ActionView::Template::Error => e
      raise ButterCmsError::MissingComponentPartial, e
  end


  def not_found
    render '404', layout: false
  end
end
