class Post < ActiveRecord::Base

	validates :title, :body, :snippet, presence: true

end
