namespace :db do
  desc 'Totally reset the database with drop, migrate, seed'
  task reload: :environment do 
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end