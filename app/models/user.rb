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

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_one :personal_detail
  has_many :workouts
  has_many :exercises, through: :workouts
  has_many :goals



  def s3_credentials
    {:bucket => "cwassets/avatars", :access_key_id => "AKIAIXBBR3HHVZRI2PFQ", :secret_access_key => "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"}
  end

end
