class HomeController < ApplicationController
  def index
    client = current_user.client

    @list = current_user.repositories.reduce({}) do |hash, r|
      commits = client.commits(r.full_name, since: (Time.now - 14.days).utc.iso8601, until: (Time.now - 13.days).utc.iso8601)
      hash[r.full_name] = commits unless commits.size == 0
      hash
    end
  end
end
