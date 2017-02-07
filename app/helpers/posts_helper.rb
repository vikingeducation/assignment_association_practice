module PostsHelper

	def posts_params
		params.require(:post).permit(:title, :body, :category_id, :tag_ids => [], :author_ids => [], :comments_attributes => [ :body, :id, :_destroy, :author_id ])
	end
end
