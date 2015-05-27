puts 'Loading contents from test/fixtures'
Rake::Task['db:fixtures:load'].invoke
