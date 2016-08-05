module PostHelper
  def category_options
    Category.all.map { |c| [c.name, c.id]} << ['na', 'na']
  end

  def tag_options
    Tag.all.map{ |t| [t.name, t.id]}
  end

end
