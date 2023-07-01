class VetInfo
{
  String doctorName;
  String location;
  String phoneNumber;

  VetInfo({
    this.doctorName = 'Empty',
    this.location = 'Empty',
    this.phoneNumber = 'No Number',
  });

  void setDoctorName(String newName)
  {
    doctorName = newName;
  }
  String getDoctorName()
  {
    return doctorName;
  }

  void setLocation(String newLocation)
  {
    location = newLocation;
  }
  String getLocation()
  {
    return location;
  }

  String getPhoneNumber()
  {
    return phoneNumber;
  }

  void setPhoneNumber(String newPhoneNumber)
  {
    phoneNumber = newPhoneNumber;
  }

}