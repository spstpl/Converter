# Controller for fetching HTML for entered URL
class Api::V1::ConverterController < ApplicationController

  require 'oembed'

  # action to fetch HTML
  def url_to_html
    # Registering Providers - Youtube and Instagram
    OEmbed::Providers.register(OEmbed::Providers::Youtube, OEmbed::Providers::Instagram)
    resource = OEmbed::Providers.get(params[:url])
    respond_to do |format|
      format.html { render json: { error: false, html: resource.html } }
      format.json { render json: { error: false, html: resource.html } }
    end
  rescue
    respond_to do |format|
      format.html { render json: { error: true, message: 'Something wrong with URL' } }
      format.json { render json: { error: true, message: 'Something wrong with URL' } }
    end
  end
end
