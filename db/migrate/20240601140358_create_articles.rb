class CreateArticles < ActiveRecord::Migration[7.1]
  def up
    create_table :articles do |t|
      t.bigint :author_id, index: true
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps
    end

    add_index :articles, :content, name: 'articles_content_ft_idx', type: :fulltext
  end

  def down
    drop_table :articles
  end
end
