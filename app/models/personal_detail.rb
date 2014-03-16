class PersonalDetail < ActiveRecord::Base

  has_paper_trail :ignore => [:gender]

  belongs_to :user

  def get_past_weight
    prior_details = []
    self.versions.each do |version|
      unless version.reify.nil?
        prior_details << version.reify.weight
      end
    end
  end

end
