class RepositoriesController < ApplicationController
  respond_to :html

  def index
    @repositories = current_user.repositories
    respond_with(@repositories)
  end

  def sync
    client = current_user.client
    client.auto_paginate = true
    client.repos.each do |repo_from_github|
      Repository.where(full_name: repo_from_github.full_name).first_or_create do |repository|
        repository.name = repo_from_github.name
        repository.full_name = repo_from_github.full_name
        repository.html_url = repo_from_github.html_url
        repository.github_id = repo_from_github.github_id
        repository.user = current_user
      end
    end

    redirect_to repositories_path, notice: 'Successfully synced.'
  end

  def switch
    repository = Repository.find(params[:id])
    repository.is_target = 1 - repository.is_target
    repository.save

    redirect_to repositories_path, notice: 'Successfully updated.'
  end
end
