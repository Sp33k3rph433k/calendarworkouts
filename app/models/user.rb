class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  INJURY_BODY_PARTS = %w(legs arms back neck feet hands shoulders wrists)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_paper_trail :only => [:avatar]

  before_save :ensure_user_has_schedule
  before_save :ensure_user_has_initial_test

  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false


  #attr_accessible :email, :password, :password_confirmation, :zip

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :progress_size => "250x250>" }, :default_url => "https://s3.amazonaws.com/calw-assets/static/avatarplaceholder.jpg",
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_one :personal_detail
  has_one :initial_test
  has_many :workouts
  has_many :exercises, through: :exercise_details
  has_many :exercise_details
  has_many :goals
  has_one :schedule
  has_one :initial_questionnaire
  has_many :injuries

  accepts_nested_attributes_for :personal_detail, :injuries

  # def initialize
  #   self.create_schedule
  # end


  def s3_credentials
    {:bucket => "calw-assets/avatars", :access_key_id => ENV['CW_AWS_ACCESS_KEY'], :secret_access_key => ENV['CW_AWS_SECRET_ACCESS_KEY']}
  end

  def workout_windows
    schedule.workout_windows
  end

  private

  def ensure_user_has_schedule
    self.create_schedule unless schedule
  end

  def ensure_user_has_initial_test
    self.create_initial_test unless initial_test
  end

end
