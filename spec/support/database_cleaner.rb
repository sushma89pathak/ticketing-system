RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)
  end

  # Before each spec check if it is a Javascript test and switch between using database transactions or not where necessary.
  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  # After each spec clean the database.
  config.after :each do
    DatabaseCleaner.clean
  end
end