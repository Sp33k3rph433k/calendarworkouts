class MuscleGroup < ActiveRecord::Base

  after_create :associate_body_parts

  DEFAULT_GROUPS = ['Abdominal', 'Biceps', 'Deltoids', 'Erector Spinae', 'Gastrocnemius and Soleus', 'Gluteus', 'Hamstrings', 'Latissimus Dorsi', 'Rhomboids', 'Obliques', 'Pectoralis', 'Quadriceps', 'Trapezius', 'Triceps']

  belongs_to :exercise
  # has_many :workouts, through: :exercise_details TODO: I don't think this really makes sense in how it's structured now
  has_many :body_parts

  private

  def associate_body_parts
    case name
      when 'Abdominal'
        bps = %w(Core Hips Lower_Back)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Biceps'
        bps = %w(Arms Wrists)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Deltoids'
        bps = %w(Shoulders Arms Wrists)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Erector Spinae'
       bps = %w(Lower_Back Upper_Back Core Neck)
       bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Gastrocnemius and Soleus'
       bps = %w(Legs Ankles Hips)
       bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Glutes'
        bps = %w(Butt Hips Legs Ankles)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Hamstrings'
        bps = %w(Legs Ankles Butt)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Latissimus Dorsi'
        bps = %w(Upper_Back Lower_Back Neck Core)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Rhomboids'
        bps = %w(Neck Upper_Back Arms Wrists)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Obliques'
        bps = %w(Core Upper_Back Lower_Back)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Pectoralis'
        bps = %w(Arms Chest Upper_Back Shoulders)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Quadriceps'
        bps = %w(Legs Ankles Butt Hips)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Trapezius'
        bps = %w(Neck Upper_Back Arms Wrists)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      when 'Triceps'
        bps = %w(Arms Wrists Shoulders)
        bps.each {|body_part| self.body_parts.create(part_name: body_part)}
      else
        nil
    end
  end

end