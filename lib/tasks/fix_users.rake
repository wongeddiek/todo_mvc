desc "Fix Users"
task :fix_users => :environment do
  User.all.each do |user|
    user.firstname = "Anon" if user.firstname.blank?
    user.lastname = "User" if user.lastname.blank?
    user.save
  end
end
