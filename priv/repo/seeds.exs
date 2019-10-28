# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Competition.Repo.insert!(%Competition.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Competition.Accounts.User
alias Competition.Repo


Repo.insert!(%User{
  first_name: "John", 
  last_name: "Hill", 
  dob: ~N[1990-01-01 12:00:00], 
  email: "john@trabian.com", 
  username: "DeathstarNovember", 
  bio_sex: "male",
  current_weight: 95.5,
  current_height: 185,
  war_cry: "Victory!", 
  inserted_at: ~N[2019-10-19 12:00:00], 
  updated_at: ~N[2019-10-19 12:00:00], 
  entries: [  
    %{distance: 500, time: 120, stroke_rate: 28, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-19 12:30:00], inserted_at: ~N[2019-10-19 12:30:00], updated_at: ~N[2019-10-19 12:30:00] },
    %{distance: 500, time: 119, stroke_rate: 29, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-19 12:32:00], inserted_at: ~N[2019-10-19 12:32:00], updated_at: ~N[2019-10-19 12:32:00] },
    %{distance: 500, time: 117, stroke_rate: 30, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-19 12:34:00], inserted_at: ~N[2019-10-19 12:34:00], updated_at: ~N[2019-10-19 12:34:00] },
    %{distance: 500, time: 118, stroke_rate: 29, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-19 12:36:00], inserted_at: ~N[2019-10-19 12:36:00], updated_at: ~N[2019-10-19 12:36:00] },
    %{distance: 500, time: 120, stroke_rate: 28, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-22 12:30:00], inserted_at: ~N[2019-10-19 12:30:00], updated_at: ~N[2019-10-19 12:30:00] },
    %{distance: 500, time: 117, stroke_rate: 29, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-25 12:32:00], inserted_at: ~N[2019-10-19 12:32:00], updated_at: ~N[2019-10-19 12:32:00] },
    %{distance: 500, time: 116, stroke_rate: 30, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-27 12:34:00], inserted_at: ~N[2019-10-19 12:34:00], updated_at: ~N[2019-10-19 12:34:00] },
    %{distance: 500, time: 115, stroke_rate: 31, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-31 12:36:00], inserted_at: ~N[2019-10-19 12:36:00], updated_at: ~N[2019-10-19 12:36:00] },
    %{distance: 1000, time: 250, stroke_rate: 28, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-20 12:30:00], inserted_at: ~N[2019-10-19 12:30:00], updated_at: ~N[2019-10-19 12:30:00] },
    %{distance: 1000, time: 245, stroke_rate: 29, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-09-22 12:32:00], inserted_at: ~N[2019-10-19 12:32:00], updated_at: ~N[2019-10-19 12:32:00] },
    %{distance: 1000, time: 240, stroke_rate: 30, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-08-25 12:34:00], inserted_at: ~N[2019-10-19 12:34:00], updated_at: ~N[2019-10-19 12:34:00] },
    %{distance: 1000, time: 239, stroke_rate: 30, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-08-30 12:36:00], inserted_at: ~N[2019-10-19 12:36:00], updated_at: ~N[2019-10-19 12:36:00] },
    %{distance: 1500, time: 380, stroke_rate: 28, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-10-18 12:30:00], inserted_at: ~N[2019-10-19 12:30:00], updated_at: ~N[2019-10-19 12:30:00] },
    %{distance: 1500, time: 374, stroke_rate: 29, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-09-22 12:32:00], inserted_at: ~N[2019-10-19 12:32:00], updated_at: ~N[2019-10-19 12:32:00] },
    %{distance: 1500, time: 370, stroke_rate: 30, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-09-25 12:34:00], inserted_at: ~N[2019-10-19 12:34:00], updated_at: ~N[2019-10-19 12:34:00] },
    %{distance: 1500, time: 365, stroke_rate: 30, max_hr: 170, avg_hr: 155, user_weight: 95.5, user_height: 185, completed_at: ~N[2019-08-30 12:36:00], inserted_at: ~N[2019-10-19 12:36:00], updated_at: ~N[2019-10-19 12:36:00] }
  ]
})
Repo.insert!(%User{
  first_name: "Felix", 
  last_name: "Green", 
  dob: ~N[1990-01-01 12:00:00], 
  email: "felix@trabian.com", 
  username: "Xeno", 
  bio_sex: "male",
  current_weight: 75.0,
  current_height: 178,
  war_cry: "Dominate!", 
  inserted_at: ~N[2019-10-19 12:00:00], 
  updated_at: ~N[2019-10-19 12:00:00],
  entries: [
    %{distance: 500, time: 133, stroke_rate: 26, user_weight: 75.0, user_height: 178, completed_at: ~N[2019-10-19 12:40:00], inserted_at: ~N[2019-10-19 12:40:00], updated_at: ~N[2019-10-19 12:40:00] },
    %{distance: 500, time: 121, stroke_rate: 24, user_weight: 75.0, user_height: 178, completed_at: ~N[2019-10-19 12:42:00], inserted_at: ~N[2019-10-19 12:42:00], updated_at: ~N[2019-10-19 12:42:00] },
    %{distance: 500, time: 145, stroke_rate: 29, user_weight: 75.0, user_height: 178, completed_at: ~N[2019-10-19 12:44:00], inserted_at: ~N[2019-10-19 12:44:00], updated_at: ~N[2019-10-19 12:44:00] },
    %{distance: 500, time: 138, stroke_rate: 27, user_weight: 75.0, user_height: 178, completed_at: ~N[2019-10-19 12:46:00], inserted_at: ~N[2019-10-19 12:46:00], updated_at: ~N[2019-10-19 12:46:00] }
  ]
})
Repo.insert!(%User{
  first_name: "Matt", 
  last_name: "Dean", 
  dob: ~N[1990-01-01 12:00:00], 
  email: "matt@trabian.com", 
  username: "DaBoss", 
  bio_sex: "male",
  current_weight: 95.0,
  current_height: 193,
  war_cry: "Nailed it!!", 
  inserted_at: ~N[2019-10-19 12:00:00], 
  updated_at: ~N[2019-10-19 12:00:00],
  entries: [
    %{distance: 500, time: 133, stroke_rate: 25, user_weight: 95.0, user_height: 193, completed_at: ~N[2019-10-19 12:50:00], inserted_at: ~N[2019-10-19 12:50:00], updated_at: ~N[2019-10-19 12:50:00] },
    %{distance: 500, time: 121, stroke_rate: 28, user_weight: 95.0, user_height: 193, completed_at: ~N[2019-10-19 12:52:00], inserted_at: ~N[2019-10-19 12:52:00], updated_at: ~N[2019-10-19 12:52:00] },
    %{distance: 500, time: 145, stroke_rate: 22, user_weight: 95.0, user_height: 193, completed_at: ~N[2019-10-19 12:54:00], inserted_at: ~N[2019-10-19 12:54:00], updated_at: ~N[2019-10-19 12:54:00] },
    %{distance: 500, time: 138, stroke_rate: 24, user_weight: 95.0, user_height: 193, completed_at: ~N[2019-10-19 12:56:00], inserted_at: ~N[2019-10-19 12:56:00], updated_at: ~N[2019-10-19 12:56:00] }  
  ]
})
