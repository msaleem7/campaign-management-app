class AddPolymorphicReferenceToTopic < ActiveRecord::Migration[6.1]
  def change
    add_reference :topics, :topic_creator, polymorphic: true, null: false
  end
end
