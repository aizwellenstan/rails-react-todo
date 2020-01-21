class DishResource < JSONAPI::Resource
    attributes :name, :rating

    has_one :restaurant
end
