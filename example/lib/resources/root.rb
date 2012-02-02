class Root
  include Hyperion::Resource

  # self link, also route
  href '/'
  # default implementation of get, model won't be set
  get

  data do
    # constant property
    version '1.0'

    # nested properties
    author do
      name 'Aaron Jensen'
      # conditional properties
      email 'aaronjensen@gmail.com', :unless => :hide_email
    end
  end

  links do
    users :href => Users
  end

  def hide_email
    false
  end
end
