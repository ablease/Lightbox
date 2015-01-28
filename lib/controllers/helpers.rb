def verify_gmc(number)
  json = File.read('api/doctors.json')
  doctors = JSON.parse(json)
  if doctors[number] == nil
    flash[:notice] = "That gmc number was not found"
    redirect to('/sign_up')
  end
end
