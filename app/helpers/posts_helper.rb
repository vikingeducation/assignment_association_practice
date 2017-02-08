module PostsHelper

	def posts_params
		params.require(:post).permit(:title, :body, :category_id, :tag_ids => [], :user_ids => [], :comments_attributes => [:body, :user_id, :id, :_destroy])
	end
end
