class CreateComments < ActiveRecord::Migration[7.1]
  def up
    create_table :comments do |t|
      t.bigint :author_id, index: true
      t.bigint :article_id, index: true
      t.text :content

      t.timestamps
    end

    add_index :comments, :content, name: 'comments_content_ft_idx', type: :fulltext
  end

  def down
    drop_table :comments
  end
end
