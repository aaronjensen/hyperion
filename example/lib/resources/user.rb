class User
  include Hyperion::Resource

  href '/users/{id}'

  get do
    model = User.find href[:id]
  end

  data do
    id
    email
    first_name
    last_name

    # computed data
    full_name { [model.first_name, model.last_name].compact.join(' ') }
  end

  links do
    # conditional links
    delete :href => :self, :method => :delete, :if => :admin?

    # embedded link
    address :href => {:resource => UserAddress, :user_id => :id}, :embed => :always

    # conditionally embedded link
    whatever :href => {:resource => UserAddress, :user_id => :id}, :embed => :first_name_starts_with_a?
  end

  def first_name_starts_with_a?
    model.first_name =~ /^a/i
  end
end
