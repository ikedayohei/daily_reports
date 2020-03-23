json.array! @companies do |company|
  json.id company.id
  json.name company.name
  json.postcode company.postcode
  json.phone_number company.phone_number
  json.capital company.capital
  json.sale company.sale
  json.description company.description
  json.characteristic company.characteristic
  json.url company.url
end