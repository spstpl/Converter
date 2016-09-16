# Article model which will have title and body(HTML)
class Article < ActiveRecord::Base
  validates :title, :body, presence: true
end
