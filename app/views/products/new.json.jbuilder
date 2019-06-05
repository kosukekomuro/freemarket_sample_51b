json.array! @category_children do |category_child|
  json.name category_child.name
  json.id category_child.id
  json.ancestry category_child.ancestry
end

json.array! @category_sizes do |category_size|
    json.size category_size.size
    json.id category_size.id
end