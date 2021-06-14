FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { "1a"+ Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'誠也'}
    birthday              {Faker::Date.in_date_period}
    position_id           { 2 }
    baseball_history_id   { 2 }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/e7019857eb9994bdda6d29d1f527a4f5.jpeg'), filename: 'e7019857eb9994bdda6d29d1f527a4f5.jpeg') 
    end  
  end
end
