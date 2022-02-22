Instance: PatientExample
InstanceOf: NCDTHPatient
Title: "NCD Thaland Patient Example"
Description: "ตัวอย่าง resource instance ที่สร้างตาม NCD Thailand Patient Profile"

* identifier
  * use = #official
  * system = $ThaiID
  * value = "1222233333445"
* active = true
* name
  * extension[$Language].valueCode = #th
  * given[0] = "สมชาย"
  * family = "ใจดี"
  * prefix = "นาย"
* gender = #male
* birthDate = "1974-12-25"
* address 
  * use = #home
  * type = #both
  * text = "532 ถ.เอราวัณ แขวงสามเสนใน เขตพญาไท กรุงเทพมหานคร 10400"
  * line = "532 ถ.เอราวัณ"
  * city = "แขวงสามเสนใน"
  * district = "เขตพญาไท"
  * state = "กรุงเทพมหานคร"
  * postalCode = "10400"
* contact
  * relationship
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0131"
      * code = #C
      * display = "Emergency Contact"
  * name
    * extension[$Language].valueCode = #th
    * given[0] = "สมสมัย"
    * family = "ใจดี"
    * prefix = "นาง"
  * telecom
    * system = #phone
    * value = "+66 (222) 33333"
  * gender = #female