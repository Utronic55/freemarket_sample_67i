FactoryBot.define do

  factory :user do
  
    nickname {"abe"}
    email {"494a98sc8d@yahoo.co.jp"}
    password {"a111111"}
    password_confirmation {"a111111"}
    last_name {"田中"}
    first_name {"太郎"}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_year_id {1}
    birth_month_id {1}
    birth_day_id {1}
    phone_num {"08012345678"}
    authentication_num {1234}
    zip_code1 {"111-1111"}
    prefecture_id {"1"}
    city {"福岡"}
    address1 {"中央区"}
    payment_card_no {1020304050607080}
    paymentmonth_id {1}
    paymentyear_id {1}
    payment_card_security_code {1234}

  end

end

  # factory :user do
  #   nickname              {"けいた"}
  #   f_name_kanji          {"中西"}
  #   l_name_kanji          {"啓太"}
  #   f_name_kana           {"ナカニシ"}
  #   l_name_kana           {"ケイタ"}
  #   birthday              {"1996-03-08"}
  #   email                 {"kkk@gmail.com"}
  #   password              {"00000000"}
  #   password_confirmation {"00000000"}
  #   tel             {"09000000000"}
  # end