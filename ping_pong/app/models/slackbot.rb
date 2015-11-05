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
    @uri = URI.parse("https://hooks.slack.com/services/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")
    @channel = channel
  end

  def generate(message)
    params = {text: "wu tang"}  
    @params = {} 
    @params[:payload] = {text: "wu tang"}.to_json 
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