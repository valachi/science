namespace :db do
  desc "Filling sample articles"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    [Article].each(&:delete_all)

      Article.populate(100) do |article|
        article.permalink = Populator.words(2..4)
        article.title = Populator.words(2..4).capitalize
        article.preview = Populator.sentences(3..5)
        article.text = Populator.sentences(20..30)
        article.created_at = 2.years.ago..Time.now
      end  
  end
end

         
