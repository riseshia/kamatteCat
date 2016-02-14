every 1.days, :at => '6:30 am' do
  rake 'report:two_week_ago_commit'
end
