json.array! @discussions.each do |discussion|
  json.partial! "discussion.json.jbuilder", discussion: discussion
end
