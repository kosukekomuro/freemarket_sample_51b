json.set! :keyword, @keyword

json.set! :reseltCount, @result_count

json.set! :products do
  json.array! @products do |product|
    json.id product.id
    json.image product.images[0].url
    json.buyer product.buyer_id
    json.name product.name
    json.price product.price
    json.likes product.likes.length
  end
end

