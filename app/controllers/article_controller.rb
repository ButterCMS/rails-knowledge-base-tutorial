require 'buttercms-ruby'
ButterCMS::api_token = ENV["BUTTER_API_TOKEN"]

class ArticleController < ApplicationController
  def index
    sectionParamsValue = params[:sectionId]
    articleParamsValue = params[:articleId]
    p params
    
    articleData = ButterCMS::Page.get('*', articleParamsValue)
    @articleData = articleData.data
    p articleData.data
  rescue ActionView::Template::Error => e
    raise ButterCmsError::MissingComponentPartial, e
  end

  def not_found
    render '404', layout: false
  end
end
