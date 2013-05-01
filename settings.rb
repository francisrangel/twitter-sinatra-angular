require 'yaml'

module Settings

  def load_file
    @settings ||= YAML.load_file('settings.yaml')
  end

  def consumer_key
    load_file
    @settings['consumer_key']
  end

  def consumer_secret
    load_file
    @settings['consumer_secret']
  end

  def oauth_token
    load_file
    @settings['oauth_token']
  end

  def oauth_token_secret
    load_file
    @settings['oauth_token_secret']
  end

end