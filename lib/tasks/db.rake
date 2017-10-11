namespace :db do
  desc "Clear Database"
  task clear: :environment do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
