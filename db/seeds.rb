# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.create!(
    genre: row["genre"],
    title: row["title"],
    content: row["content"]
  )
  puts "テキストの初期データインポートに成功しました。"
end

CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create!(
    genre: row["genre"],
    title: row["title"],
    url: row["url"]
  )
  puts "動画の初期データインポートに成功しました。"
end

admin_email = "admin@example.com"
AdminUser.find_or_create_by!(email: admine_email) do |adminuser|
  adminuser.password = password
  puts "管理ユーザーの初期データインポートに成功しました。"
end
