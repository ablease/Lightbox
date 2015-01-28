def verify_gmc(number, name)
  json = File.read('api/doctors.json')
  doctors = JSON.parse(json)
  if doctors[number] == nil
    flash[:notice] = "That gmc number was not found"
    redirect to('/sign_up')
  end

  if doctors[number]["first_name"] != name
    flash[:notice] = "The name and GMC number you provided do not match"  
    redirect to('/sign_up')
  end
end
