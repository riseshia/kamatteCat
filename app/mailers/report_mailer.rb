class ReportMailer < ApplicationMailer
  def commits_on_2weeks_ago(user)
    client = user.client

    count = 0
    @list = user.repos_to_check.reduce({}) do |hash, r|
      commits = client.commits(r.full_name, author: user.email, since: (Time.now - 14.days).utc.iso8601, until: (Time.now - 13.days).utc.iso8601)
      unless commits.size == 0
        hash[r.full_name] = commits 
        count += 1
      end
      hash
    end

    mail(to: user.email, subject: "[#{Time.zone.now.strftime('%F')}] Your commits before 2 weeks ago.") unless count == 0
  end
end
