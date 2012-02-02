class User
  include Hyperion::Resource

  href '/users/{id}'

  data do
    id
    email
    first_name
    last_name
    full_name { [model.first_name, model.last_name].compact.join(' ') }
  end

  links do
    delete :href => :self, :method => :delete, :if => :admin?
    address :href => {:resource => UserAddress, :user_id => :id}, :embed => :always
  end
end
