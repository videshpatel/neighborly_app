json.array! @channels.each do |channel|
  json.partial! "channel.json.jbuilder", channel: channel
end
