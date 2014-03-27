class Post < ActiveRecord::Base

	has_many :comments

	validates :text, :presence =>true

	validates :title, :presence=>true,:length=>{:minimum=>5}
end

