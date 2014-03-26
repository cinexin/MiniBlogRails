class Post < ActiveRecord::Base
	validates :text, :presence =>true
	validates :title, :presence=>true,:length=>{:minimum=>5}
end

