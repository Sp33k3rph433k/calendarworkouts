# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exercise do
    name "Ab Ripper"
    youtube_url "http://www.youtube.com/abripperx"
    proper_form_text "You should be ripping those abs, YEAH!! RIP EM!!"
    mini_image_url "http://lorempixel.com/g/200/200"
    is_run false
  end
end