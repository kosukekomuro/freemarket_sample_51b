json.array! @category_children do |category_child|
  json.name category_child.name
  json.id category_child.id
  json.ancestry category_child.ancestry
end

json.array! @category_sizes do |category_size|
    json.size category_size.size
    json.id category_size.id
end

json.array! @delivery_children do |delivery_child|
  json.name delivery_child.name
  json.id delivery_child.id
  json.ancestry delivery_child.ancestry
end

json.array! @brand_names do |brand_name|
  json.brand brand_name.brand
end

