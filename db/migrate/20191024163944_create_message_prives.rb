class CreateMessagePrives < ActiveRecord::Migration[5.2]
  def change
    create_table :message_prives do |t|
    	t.references :recipient, index: true
    	t.references :sender, index: true
    	t.text :content
    end
  end
end
