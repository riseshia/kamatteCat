# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :report do
  task two_week_ago_commit: :environment do
    puts '--- Start to Working ---'

    User.all.each do |user|
      ReportMailer.commits_on_2weeks_ago(user).deliver_now
    end

    puts '--- Finished ---'

    require 'net/http'
    uri = URI('https://lazycat.nyatorie.com/api')
    Net::HTTP.post_form(uri, token: ENV['LAZYCAT_TOKEN'], status: 'ok', message: "Sending Report is done on #{Time.zone.now.strftime('%F')}.")
  end

end
