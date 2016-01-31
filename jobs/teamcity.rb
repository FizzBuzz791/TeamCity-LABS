require 'teamcity'

config_file = File.dirname(File.expand_path(__FILE__)) + '/../config/teamcity.yml'
config = YAML::load(File.open(config_file))

TeamCity.configure do |c|
  c.endpoint = config['api_url']
  c.http_user = config['http_user']
  c.http_password = config['http_password']
end

SCHEDULER.every '60s', :first_in => '1s' do
  if config['repositories'].nil?
    puts 'No TeamCity repositories found :('
  else
    config['repositories'].each do |data_id, build_id| 
      send_event(data_id, { :items => update_builds(build_id)})
    end
  end
end

def update_builds(project_id)
  builds = []
  projects = Array.new

  project = TeamCity.project(:id => project_id)
  build_types = Array.new {Array.new}

    TeamCity.project_buildtypes(:id => project['id']).each do |build_type|
      build_types.push({
          :id => build_type.id,
          :name => build_type.name
      })
    end

    build_types.each do |build_type|
      build_type_builds = TeamCity.builds(:buildType => build_type[:id], :branch => 'default:any')
      unless build_type_builds.nil?
        latest_build = build_type_builds.first
        max_build_number = latest_build.id
        build_type_builds.each do |build|
            if build.id > max_build_number
                latest_build = build
            end
        end

      uname = 'Unassigned'
	  if !TeamCity.build(:id => latest_build.id).lastChanges.nil?
	    uname = TeamCity.build(:id => latest_build.id).lastChanges.change.first['username']
      end
        
      build_type['last_build'] = {
          :id => latest_build.id,
          :number => latest_build.number,
          :state => latest_build.state,
          :status => latest_build.status,
          :username => uname
      }
    end
  end

    projects.push({
      :name => project.description,
      :id => project.id,
      :description => project.description,
      :build_types => build_types
    })

  build_info = {
      :title => project_id,
      :projects => projects
  }

  builds << build_info

  builds
end
