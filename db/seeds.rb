# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user_data = [
  {
    username: 'johndoe',
    email: 'johndoe@mail.com',
    password: 'JohnDummy1',
    first_name: 'John',
    last_name: 'Doe',
  },
  {
    username: 'janedoe',
    email: 'janedoe@mail.com',
    password: 'JaneDummy1',
    first_name: 'Jane',
    last_name: 'Doe',
  },
]

users = User.create!(user_data)

articles_data = [
  {
    author_id: users.first.id,
    title: 'First Article',
    content: 'Exploring the serene landscapes of the countryside, the tranquility of nature envelops you. Rolling hills, vibrant with wildflowers, stretch endlessly under the clear blue sky. Birds chirp melodiously, creating a symphony with the gentle rustle of leaves. This peaceful retreat offers a perfect escape from the hustle and bustle of city life.',
    published_at: Time.now - 3.days,
    comments: [
      {
        author_id: users.second.id,
        content: 'Great article!',
      },
      {
        author_id: users.second.id,
        content: 'I love it!',
      },
    ],
  },
  {
    author_id: users.second.id,
    title: 'Second Article',
    content: "In today's fast-paced world, maintaining a healthy work-life balance is crucial. Prioritizing self-care and hobbies can significantly improve mental well-being. Engaging in regular exercise, spending time with loved ones, and pursuing passions outside of work are essential for a balanced and fulfilling life.",
    published_at: Time.now - 2.days,
    comments: [
      {
        author_id: users.first.id,
        content: 'Nice article!',
      },
      {
        author_id: users.first.id,
        content: 'Very informative!',
      },
    ],
  },
  {
    author_id: users.first.id,
    title: 'Third Article',
    content: "Artificial intelligence (AI) is transforming industries by automating tasks and improving efficiency. From healthcare to finance, AI applications are making processes faster and more accurate. Machine learning, a subset of AI, enables systems to learn from data and adapt over time, driving innovation and enhancing decision-making across various sectors.",
    published_at: Time.now - 1.day,
    comments: [
      {
        author_id: users.first.id,
        content: 'Wow! This is amazing!',
      },
      {
        author_id: users.first.id,
        content: 'Well done!',
      },
    ],
  },
  {
    author_id: users.second.id,
    title: 'Fourth Article',
    content: "Just a dummy article",
    published_at: Time.now,
    comments: [],
  },
]

articles_data.each do |article_data|
  new_article = Article.create(article_data.except(:comments))

  comments = article_data[:comments]

  next if comments.blank?
  new_article.comments.create(article_data[:comments])
end
