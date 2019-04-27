json.array! @replies.each do |reply|
  json.partial! "reply.json.jbuilder", reply: reply
end
