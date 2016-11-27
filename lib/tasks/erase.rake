namespace :erase do
  #Oculto -when run rake -T
  task :comments => :environment do
    Comment.destroy_all
  end
  #Oculto -when run rake -T
  task :posts => :environment do
    Post.destroy_all
  end
  desc "Erases All Comments And Posts"
  task :PostsAndComments => [:comments,:posts]do
    puts   "Deleted All Comments And Posts"
  end
end
