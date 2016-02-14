# ApplicationHelper
module ApplicationHelper
  def switcher(repository)
    link_to repository.is_target_to_s == 'ON' ? 'Turn off' : 'Turn on', switch_repository_path(repository), method: :post
  end
end
