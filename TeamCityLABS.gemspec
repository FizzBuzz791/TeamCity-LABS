Gem::Specification.new do |s|
  s.name = 'TeamCityLABS'
  s.version = '1.0.0.2'
  s.date = '2016-01-31'
  s.summary = 'TeamCity Latest Build Status'
  s.description = 'A Dashing Widget to display the latest build status of all builds within a project.'
  s.authors = ['Trent Jones']
  s.email = 'trent.william.jones@gmail.com'
  s.files = %w(config/teamcity.yml jobs/teamcity.rb widgets/team_city/team_city.coffee widgets/team_city/team_city.html widgets/team_city/team_city.scss)
  s.homepage = 'https://github.com/FizzBuzz791/TeamCity-LABS'
  s.license = 'MIT'
  s.post_install_message = 'Thanks for installing. Please copy all files from /var/lib/gems/x.y.z/gems/TeamCityLABS-w.x.y.z to your Dashboard directory.'
end