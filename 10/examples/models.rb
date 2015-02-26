@config = YAML.load_file(File.expand_path("./db/config.yml"))[settings.environment.to_s]
ActiveRecord::Base.establish_connection @config

class Service<ActiveRecord::Base
  has_many :visits

  validates :label, presence: true
  validates :counter, numericality: {only_integer: true, greater_thanor_equal: 0}
  validates_associated :visits


  paginates_per 5

end

class Visit<ActiveRecord::Base
  belongs_to :service, dependent: :destroy, counter_cache: true

  scope :for_service, ->(id) { where(:service_id => id) }
  scope :last_week, ->() {where("created_at <=? and created_at>=?", Date.today, Date.today-1.week)}

  paginates_per 5



end
