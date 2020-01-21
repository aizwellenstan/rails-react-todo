class RestaurantResource < JSONAPI::Resource
    attributes :name, :address

    has_many :dishes
end
