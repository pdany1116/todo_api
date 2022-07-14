# frozen_string_literal: true

Rails.application.default_url_options[:host] = ENV.fetch('HOST_URL')
