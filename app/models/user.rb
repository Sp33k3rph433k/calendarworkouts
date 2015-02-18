class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_paper_trail :only => [:avatar]

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
  has_many :exercises, through: :workouts
  has_many :goals

  accepts_nested_attributes_for :personal_detail


  def s3_credentials
    {:bucket => "calw-assets/avatars", :access_key_id => "AKIAIBOYEOEUKG3EWWMQ", :secret_access_key => "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"}
  end

end
