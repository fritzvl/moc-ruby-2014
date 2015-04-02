module ArticlesHelper

  def counter
    Article.all.count
  end

end
