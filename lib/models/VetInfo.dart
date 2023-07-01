class VetInfo
{
  String doctorName;
  String location;
  String phoneNumber;
  String petAllergies;

  VetInfo({
    this.doctorName = '',
    this.location = '',
    this.phoneNumber = '',
    this.petAllergies = '',
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

}