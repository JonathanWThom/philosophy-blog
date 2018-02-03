class AddAwsCredentialsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :aws_credentials, :jsonb, null: false, default: {}
  end
end
