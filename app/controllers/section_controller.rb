require 'buttercms-ruby'
ButterCMS::api_token = ENV["BUTTER_API_TOKEN"]

class SectionController < ApplicationController
  def index
    ## get homepage
    homeData = ButterCMS::Page.get('*', "kb-homepage")
    @homeData = homeData.data
    # p homeData.data

    ## get section
    sectionParamsValue = params[:sectionId]
    query = params[:params]
    if sectionParamsValue != 'not-found'
      sectionData = ButterCMS::Page.get('*', sectionParamsValue)
      @sectionData = sectionData.data
      @sectionParamsValue = sectionParamsValue
      # p sectionData.data
    else
      @query = session[:queryValue]
      @sectionData = nil
      # p sectionData
    end

    p params
    p sectionParamsValue

  rescue ActionView::Template::Error => e
    raise ButterCmsError::MissingComponentPartial, e
  end

  def not_found
    render '404', layout: false
  end
end
