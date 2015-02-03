@config = YAML.load_file(File.expand_path("./db/config.yml"))[settings.environment.to_s]
ActiveRecord::Base.establish_connection @config

class Service<ActiveRecord::Base
  has_many :visits
  validates :label, presence: true


end

class Visit<ActiveRecord::Base
  belongs_to :service
end
