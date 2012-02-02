class UsersAddress
  include Hyperion::Resource

  href '/users/{user_id}/address'

  get do
    model = Address.find_by_user_id(href[:user_id])
  end

  data do
    street_address
    city
    state
  end
end
