require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "3badcadfcf640844803778c1d9a1ab44a209e23ec238a0417595ed6d531e7cab"

  url_format "/media/:job/:name"

  if Rails.env.production?
    datastore :s3,
      bucket_name: 'edzo-dragonfly',
      region: 'eu-west-1',
      access_key_id: ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET']
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end

  processor :padded_resize do |content, geometry|
    content.process!(:convert, "-resize #{geometry}\\> -size #{geometry} xc:transparent +swap -gravity center -composite", 'png')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
