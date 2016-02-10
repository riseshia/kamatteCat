json.array!(@repositories) do |repository|
  json.extract! repository, :id, :name, :full_name, :html_url, :github_id, :is_target
  json.url repository_url(repository, format: :json)
end
