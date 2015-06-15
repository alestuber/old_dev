namespace :mf do
  desc 'Update database from warehouse'
  task update_db: :environment do
    puts RestClient.get('https://the-mf-warehouse.herokuapp.com/')
  end
end
