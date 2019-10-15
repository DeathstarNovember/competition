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
  password_hash: "123lk4jg2jk55k1j23", 
  war_cry: "Victory!", 
  inserted_at: ~N[2019-10-19 12:00:00], 
  updated_at: ~N[2019-10-19 12:00:00], 
  entries: [  
    %{distance: 500, time: 120, stroke_rate: 28, completed_at: ~N[2019-10-19 12:30:00], inserted_at: ~N[2019-10-19 12:30:00], updated_at: ~N[2019-10-19 12:30:00] },
    %{distance: 500, time: 119, stroke_rate: 29, completed_at: ~N[2019-10-19 12:32:00], inserted_at: ~N[2019-10-19 12:32:00], updated_at: ~N[2019-10-19 12:32:00] },
    %{distance: 500, time: 117, stroke_rate: 30, completed_at: ~N[2019-10-19 12:34:00], inserted_at: ~N[2019-10-19 12:34:00], updated_at: ~N[2019-10-19 12:34:00] },
    %{distance: 500, time: 118, stroke_rate: 29, completed_at: ~N[2019-10-19 12:36:00], inserted_at: ~N[2019-10-19 12:36:00], updated_at: ~N[2019-10-19 12:36:00] }
  ]
})
Repo.insert!(%User{
  first_name: "Felix", 
  last_name: "Green", 
  dob: ~N[1990-01-01 12:00:00], 
  email: "felix@trabian.com", 
  username: "Xeno", 
  password_hash: "2l2k3j5g;lhp1o32iu", 
  war_cry: "Dominate!", 
  inserted_at: ~N[2019-10-19 12:00:00], 
  updated_at: ~N[2019-10-19 12:00:00],
  entries: [
    %{distance: 500, time: 133, stroke_rate: 26, completed_at: ~N[2019-10-19 12:40:00], inserted_at: ~N[2019-10-19 12:40:00], updated_at: ~N[2019-10-19 12:40:00] },
    %{distance: 500, time: 121, stroke_rate: 24, completed_at: ~N[2019-10-19 12:42:00], inserted_at: ~N[2019-10-19 12:42:00], updated_at: ~N[2019-10-19 12:42:00] },
    %{distance: 500, time: 145, stroke_rate: 29, completed_at: ~N[2019-10-19 12:44:00], inserted_at: ~N[2019-10-19 12:44:00], updated_at: ~N[2019-10-19 12:44:00] },
    %{distance: 500, time: 138, stroke_rate: 27, completed_at: ~N[2019-10-19 12:46:00], inserted_at: ~N[2019-10-19 12:46:00], updated_at: ~N[2019-10-19 12:46:00] }
  ]
})
Repo.insert!(%User{
  first_name: "Matt", 
  last_name: "Dean", 
  dob: ~N[1990-01-01 12:00:00], 
  email: "matt@trabian.com", 
  username: "DaBoss", 
  password_hash: "325iot1o8y98433904p", 
  war_cry: "Nailed it!!", 
  inserted_at: ~N[2019-10-19 12:00:00], 
  updated_at: ~N[2019-10-19 12:00:00],
  entries: [
    %{distance: 500, time: 133, stroke_rate: 25, completed_at: ~N[2019-10-19 12:50:00], inserted_at: ~N[2019-10-19 12:50:00], updated_at: ~N[2019-10-19 12:50:00] },
    %{distance: 500, time: 121, stroke_rate: 28, completed_at: ~N[2019-10-19 12:52:00], inserted_at: ~N[2019-10-19 12:52:00], updated_at: ~N[2019-10-19 12:52:00] },
    %{distance: 500, time: 145, stroke_rate: 22, completed_at: ~N[2019-10-19 12:54:00], inserted_at: ~N[2019-10-19 12:54:00], updated_at: ~N[2019-10-19 12:54:00] },
    %{distance: 500, time: 138, stroke_rate: 24, completed_at: ~N[2019-10-19 12:56:00], inserted_at: ~N[2019-10-19 12:56:00], updated_at: ~N[2019-10-19 12:56:00] }  
  ]
})
