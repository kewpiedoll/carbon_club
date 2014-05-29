FactoryGirl.define do 
  factory :producer do 
    user_name             "Chris"
    full_name             "Chris A"
    re_system_type        "2"
    init_kwh_reading      "1910"
    email                 "biodieselchris@gmail.com"
    password              'qqqwwweee'
    encrypted_password    'qqqwwweee'
    confirmed_at          Time.now
    created_at            Time.now
    updated_at            Time.now
  end
end
