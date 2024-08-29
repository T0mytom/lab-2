# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Limpia la data para poblarla
User.destroy_all
Post.destroy_all
Comment.destroy_all

# Create Users
users = User.create!([
  { email: 'walter.white@breakingbad.com', first_name: 'Walter', last_name: 'White' },
  { email: 'bob.johnson@example.com', first_name: 'Bob', last_name: 'Johnson' },
  { email: 'carol.danvers@example.com', first_name: 'Carol', last_name: 'Danvers' },
  { email: 'wade.wilson@marvel.com', first_name: 'Wade', last_name: 'Wilson' },
  { email: 'tazamorano@miuandes.cl', first_name: 'Tomas', last_name: 'Zamorano' },
  { email: 'joel.miller@naughtydog.com', first_name: 'Joel', last_name: 'Miller' },
  { email: 'grace.howard@zenless.com', first_name: 'Grace', last_name: 'Howard' },
  { email: 'hank.pim@ant.com', first_name: 'Hank', last_name: 'Pim' },
  { email: 'mia.elfie@example.com', first_name: 'Mia', last_name: 'Elfie' },
  { email: 'eva.anderson@example.com', first_name: 'Eva', last_name: 'Anderson' }
])

# Create Posts
posts = Post.create!([
  { title: 'Breaking Bad Analysis', content: 'A deep dive into the chemistry of Walter White’s methods. This post explores the real science behind the show, providing detailed explanations and scientific analysis to support the fictional scenarios depicted in the popular TV series. This thorough examination will help viewers understand the realistic aspects and inaccuracies presented throughout the show.', published: :published, author: 'walter.white@breakingbad.com' },
  { title: 'The Life of Bob Johnson', content: 'An autobiographical post from Bob Johnson detailing his experiences and perspectives. This narrative captures the essence of Bob’s life journey, from his early years to his present-day experiences, offering a personal and introspective look into the life of an intriguing individual.', published: :unpublished, author: 'bob.johnson@example.com' },
  { title: 'Carol’s Heroic Journey', content: 'Carol Danvers writes about her heroic experiences and what it means to be a hero in modern times. Her reflections on bravery, sacrifice, and the personal growth that comes with overcoming challenges provide a profound and inspiring account of her journey through adversity and triumph.', published: :published, author: 'carol.danvers@example.com' },
  { title: 'Wade Wilson’s Tips', content: 'Wade Wilson shares his top tips for surviving in a superhero world, filled with humor and insight. His advice covers a range of topics from dealing with supervillains to handling everyday challenges with a touch of wit and resilience, providing readers with both practical and entertaining guidance.', published: :published, author: 'wade.wilson@marvel.com' },
  { title: 'Tomas Zamorano’s Tech Insights', content: 'Tomas Zamorano offers a deep dive into the latest trends in technology and what to expect in the future. This post includes detailed analysis and predictions on technological advancements, innovations, and their potential impact on various industries, offering readers a comprehensive overview of what lies ahead in the tech world.', published: :unpublished, author: 'tazamorano@miuandes.cl' },
  { title: 'Joel’s Survival Guide', content: 'Joel Miller provides a guide on surviving tough situations, based on his experiences. His practical advice, drawn from real-life scenarios, covers survival strategies, essential skills, and mental resilience needed to navigate challenging circumstances effectively.', published: :published, author: 'joel.miller@naughtydog.com' },
  { title: 'Grace’s Zen Philosophy', content: 'Grace Howard’s reflections on achieving inner peace and balancing life’s demands. This post delves into Grace’s personal philosophy on maintaining tranquility and balance amidst the chaos of daily life, offering insights and practices for achieving a more harmonious and fulfilling existence.', published: :published, author: 'grace.howard@zenless.com' },
  { title: 'Hank Pim’s Science Fun', content: 'Hank Pim explores fun scientific experiments and their implications for everyday life. His post presents a series of engaging and educational experiments that demonstrate fundamental scientific principles, showcasing the excitement and wonder of science in a hands-on and accessible way.', published: :unpublished, author: 'hank.pim@ant.com' },
  { title: 'Mia’s Artistic Vision', content: 'Mia Elfie shares her artistic journey and what inspires her creative process. This post provides a glimpse into Mia’s artistic evolution, her sources of inspiration, and the techniques she employs to bring her creative visions to life, offering readers an intimate look into the world of art and creativity.', published: :published, author: 'mia.elfie@example.com' },
  { title: 'Eva’s Career Advice', content: 'Eva Anderson provides valuable career advice based on her experiences in the industry. Her post covers key strategies for career development, overcoming obstacles, and achieving professional growth, drawing from her own journey and offering practical tips for success in the competitive job market.', published: :unpublished, author: 'eva.anderson@example.com' }
])


# Create Comments
Comment.create!([
  { content: 'Amazing post, Walter! Learned a lot about the real science.', author: 'bob.johnson@example.com', post_id: posts[0].id },
  { content: 'Great insights, Walter. Really enjoyed this read.', author: 'carol.danvers@example.com', post_id: posts[0].id },
  { content: 'Bob, your story is inspiring! Thanks for sharing.', author: 'walter.white@breakingbad.com', post_id: posts[1].id },
  { content: 'Very engaging read, Bob. Keep up the good work!', author: 'carol.danvers@example.com', post_id: posts[1].id },
  { content: 'Carol, your post was very inspiring. Thanks for sharing your journey.', author: 'wade.wilson@marvel.com', post_id: posts[2].id },
  { content: 'Loved the perspective, Carol. Very well written.', author: 'tazamorano@miuandes.cl', post_id: posts[2].id },
  { content: 'Wade, your tips are incredibly useful and entertaining.', author: 'joel.miller@naughtydog.com', post_id: posts[3].id },
  { content: 'Haha, Wade! Your sense of humor makes this even better.', author: 'grace.howard@zenless.com', post_id: posts[3].id },
  { content: 'Tomas, your insights on technology are spot on!', author: 'hank.pim@ant.com', post_id: posts[4].id },
  { content: 'Very thought-provoking, Tomas. Appreciate your analysis.', author: 'mia.elfie@example.com', post_id: posts[4].id }
])
