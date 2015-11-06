require 'uri'
require 'net/http'

class Slackbot
  # NAME_AND_ICON = {
  #     username: 'Bespoke Bot',
  #     icon_emoji: ':bat:'
  # }

  # GOOD = 'good'
  # WARNING = 'warning'
  # DANGER = 'danger'

  def initialize(channel = '#pingpongchannel')
    keys = YAML.load_file('application.yml')
    @uri = URI.parse(keys['SLACK_WEBHOOK_URL'])
    @channel = channel
  end

  def generate(message)
    params = {text: "#{message}"}  
    @params = {} 
    @params[:payload] = {username: "PingPongBot", text: "#{message}"}.to_json 
    self
  end

  def deliver
    begin
      Net::HTTP.post_form(@uri, @params)
    rescue => e
      Rails.logger.error("BespokeSlackbotService: Error when sending: #{e.message}")
    end
  end

  private

  # def generate_payload(params)
  #   {
  #       payload: 
  #                    .merge(channel: @channel)
  #                    .merge(params).to_json
  #   }
  # end
end