[![Gem Version](https://badge.fury.io/rb/TeamCityLABS.svg)](https://badge.fury.io/rb/TeamCityLABS)

## Description

Basic [Dashing](http://dashing.io/) widget to display TeamCity build info. Based on [TeamCity Grouped Extended](https://gist.github.com/jimmirra/76272c91b70ec8ee372b). The widget has been trimmed back to display a bottom level Project and all associated builds. For each build, it displays the most recent build, the user who's check-in triggered the build and its' status. If a build has the state `FAILURE` then the widget flashes red.

##Dependencies

[teamcity-ruby-client](https://github.com/jperry/teamcity-ruby-client)

Add it to dashing's gemfile:

    gem 'teamcity-ruby-client'

and run `bundle install`.

## Usage

 1. Copy all files from `/var/lib/gems/x.y.z/gems/TeamCityLABS-w.x.y.z` to your Dashboard directory.
 2. Edit `teamcity.yml` to include your credentials.
 3. Use the following snippet in your `dashboard.erb` file.

    ``` HTML
    <li data-row="1" data-col="1" data-sizex="1" data-sizey="3">  
        <div data-id="template-data-id1" data-image="/project-icon.png" data-view="TeamCity" data-unordered="true" data-title="TITLE"></div>
    </li>
    ```

## Notes

This has been tested against TeamCity Enterprise 9.1.4 (build 37293). If you have success with your version of TeamCity, please let me know. If you don't have success, please raise an issue and/or pull request.
