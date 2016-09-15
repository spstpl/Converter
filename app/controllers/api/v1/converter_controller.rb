class Api::V1::ConverterController < ApplicationController

  require 'oembed'

  def url_to_html
    OEmbed::Providers.register(OEmbed::Providers::Youtube, OEmbed::Providers::Instagram)
    resource = OEmbed::Providers.get(params[:url])
    respond_to do |format|
      format.json { render json: { error: false, html: resource.html } }
    end
  rescue
    respond_to do |format|
      format.json { render json: { error: true, message: 'Something wrong with URL' } }
    end
  end
end
