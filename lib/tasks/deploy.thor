#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rubygems'
require 'thor'

class Deploy < Thor
  include Thor::Actions

  USER = 'mortik'
  HOST = 'mortik.de'
  DEPLOY_TO = '~/current'

  desc 'start', 'Deploy site to server'
  def start
    puts 'Starting deployment...'
    build
    deploy
    puts 'Deployment Finished'
  end

  no_commands do
    private def build
      puts 'Building current site...'
      run %(bundle exec middleman build)
    end

    private def deploy
      puts 'Syncing files...'
      run %(rsync -a -P ./build/ #{USER}@#{HOST}:#{DEPLOY_TO})
    end
  end
end
