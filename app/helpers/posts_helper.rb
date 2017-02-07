module PostsHelper

	def posts_params
		params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
	end
end
