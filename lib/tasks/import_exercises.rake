require 'csv'

namespace :exercises do
  task :import => :environment do

    exercises = CSV.parse(IO.read('best.csv'), :headers=>true,
                          :header_converters=> lambda {|f| f ? f.strip : nil},
                          :converters=> lambda {|f| f ? f.strip : nil})

    exercises.each do |exercise|
      unless exercise["name"] == nil
        e = Exercise.create(name: exercise["name"], youtube_url: exercise["youtube_url"], proper_form_text: exercise["proper_form_text"], cardio: (exercise["is_run"] == "yes" ? true : false), requires_gym: (exercise["requires_gym"] == "yes" ? true : false))
        (1..5).each do |inc|
          unless exercise["muscle_group_#{inc}"].nil?
            e.muscle_groups.create(name: exercise["muscle_group_#{inc}"], weighted_score: exercise["#{inc}_weighted_score"])
          end
        end
      end
    end
  end
end
