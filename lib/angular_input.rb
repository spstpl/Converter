class AngularInput
  include Formtastic::Inputs::Base

  def to_html
   html =  "<label class='label' for='article_title'>Body</label>" +
    "<div ng-app='articleApp' ng-controller='articleController' class='admin_article_body' id='article_body_container'>" +
    "<article-body></article-body><div id='url_error'><div></div>"
    input_wrapping do
      builder.template.content_tag(:preview, html, { id: 'body' }, false)
    end
  end
end
