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
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Biceps'
        bps = %w(Arms Wrists)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Deltoids'
        bps = %w(Shoulders Arms Wrists)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Erector Spinae'
       bps = %w(Lower_Back Upper_Back Core Neck)
       bps.each do |body_part|
         unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
          body_parts.create(part_name: body_part)
         end
       end
      when 'Gastrocnemius and Soleus'
       bps = %w(Legs Ankles Hips)
       bps.each do |body_part|
         unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
          body_parts.create(part_name: body_part)
         end
       end
      when 'Glutes'
        bps = %w(Butt Hips Legs Ankles)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Hamstrings'
        bps = %w(Legs Ankles Butt)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Latissimus Dorsi'
        bps = %w(Upper_Back Lower_Back Neck Core)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Rhomboids'
        bps = %w(Neck Upper_Back Arms Wrists)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Obliques'
        bps = %w(Core Upper_Back Lower_Back)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Pectoralis'
        bps = %w(Arms Chest Upper_Back Shoulders)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Quadriceps'
        bps = %w(Legs Ankles Butt Hips)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Trapezius'
        bps = %w(Neck Upper_Back Arms Wrists)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      when 'Triceps'
        bps = %w(Arms Wrists Shoulders)
        bps.each do |body_part|
          unless exercise && exercise.body_parts.any? { |part| part.part_name == body_part }
            body_parts.create(part_name: body_part)
          end
        end
      else
        nil
    end
  end

end