class AddArticleIdToWriter < ActiveRecord::Migration
  def change
    add_belongs_to :writers, :article, index: true
  end
end
