Instance: patient-example
InstanceOf: NCDTHPatient
Title: "Patient"
Description: "ตัวอย่างข้อมูลคนไข้"

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


Instance: organization-example
InstanceOf: NCDTHOrganization
Title: "Organization"
Description: "ตัวอย่างข้อมูลโรงพยาบาล"

* identifier
  * system = "http://thcc.or.th/hcode"
  * value = "12345"
* name = "โรงพยาบาล NCD"
* address
  * text = "199 ถ.เอราวัณ แขวงสามเสนใน เขตพญาไท กรุงเทพมหานคร 10400"
  * line = "199 ถ.เอราวัณ"
  * city = "แขวงสามเสนใน"
  * district = "เขตพญาไท"
  * state = "กรุงเทพมหานคร"
  * postalCode = "10400"
* telecom
  * system = #phone
  * value = "+66 (333) 2222"

Instance: coverage-example
InstanceOf: NCDTHCoverage
Title: "Coverage"
Description: "ตัวอย่างข้อมูลสิทธิ์การรักษาของคนไข้ที่ใช้บัตรทอง"

* status = #active
* type.coding[0] = THGovernmentCoverageTypeCS#UC "Universal Coverage"
* type.coding[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#PUBLICPOL "public healthcare"
* beneficiary = Reference(patient-example)
* payor
  * display = "Government"

Instance: episode-of-care-example
InstanceOf: NCDTHEpisodeOfCare
Title: "EpisodeOfCare"
Description: "ตัวอย่าง episode of care ของการดูแลโรคเรื้อรังเบาหวานและความดันโลหิตสูง"

* identifier
  * system = "http://examplehospital.com/episode"
  * value = "1234"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/episodeofcare-type#hacc "Home and Community Care"
* diagnosis[0]
  * condition = Reference(condition-example1)
* diagnosis[+]
  * condition = Reference(condition-example2)
* patient = Reference(patient-example)
* managingOrganization = Reference(organization-example)
* period
  * start = "2022-02-02"
* careManager = Reference(Practitioner) // TODO
* team = Reference(CareTeam) // TODO

Instance: encounter-example
InstanceOf: NCDTHEncounter
Title: "Encounter"
Description: "ตัวอย่างข้อมูลการไปตรวจ OPD ของผู้ป่วย"

* identifier
  * system = "http://examplehospital.com/episode"
  * value = "1234"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type = $SCT#703040004 "Agreeing on diabetes care plan"
* subject = Reference(patient-example)
* episodeOfCare = Reference(episode-of-care-example)
* participant
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF "primary performer"
  * individual = Reference(Practitioner) // TODO
* serviceProvider = Reference(organization-example)

Instance: family-member-history-example
InstanceOf: NCDTHFamilyMemberHistory
Title: "FamilyMemberHistory"
Description: "ตัวอย่างประวัติข้อมูลมารดาของผู้ป่วยที่เสียชีวิตจากโรคมะเร็ง"

* status = #completed
* patient = Reference(patient-example)
* name = "นางสมหมาย ใจดี"
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"
* bornDate = "1934-05-06"
* ageAge = 88 'a' "years"
* deceasedBoolean = true
* reasonCode = $SCT#363406005 "Malignant neoplasm of colon"

Instance: condition-example1
InstanceOf: NCDTHCondition
Title: "Condition 1 - Hypertension"
Description: "ตัวอย่างข้อมูลโรคความดันโลหิตสูง (Hypertension)"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"
* severity = $SCT#255604002 "Mild"
* code = $SCT#38341003 "Hypertension"
* subject = Reference(patient-example)
* onsetDateTime = "2016"

Instance: condition-example2
InstanceOf: NCDTHCondition
Title: "Condition 2 - Diabetes Mellitus"
Description: "ตัวอย่างข้อมูลโรคความเบาหวาน (Diabetes Mellitus)"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"
* severity = $SCT#255604002 "Mild"
* code = $SCT#473127005 "Suspected diabetes mellitus"
* subject = Reference(patient-example)
* onsetDateTime = "2022-01-31"

Instance: diagnostic-report-lab-example1
InstanceOf: NCDTHDiagnosticReportLab
Title: "DiagnosticReport - Lab Lipid Profile"
Description: "ตัวอย่างการรายงานผล Lipid Profile"

* status = #final
* category
  * coding.system = "http://terminology.hl7.org/CodeSystem/v2-0074"
  * coding.code = #LAB
* code
  * coding.system = "http://tmlt.this.or.th"
  * coding.code = #320259
  * coding.display = "Lipid profile (Cholesterol, HDL-chol, LDL-chol, TG)"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T13:28:17+07:00"
* issued = "2022-02-20T13:28:17+07:00"
* result[0] = Reference(observation-example-chol)
* result[+] = Reference(observation-example-hdl)
* result[+] = Reference(observation-example-ldl)
* result[+] = Reference(observation-example-tg)

Instance: diagnostic-report-lab-example2
InstanceOf: NCDTHDiagnosticReportLab
Title: "DiagnosticReport - Lab Metabolic Profile"
Description: "ตัวอย่างการรายงานผล Metabolic Profile (Glucose, BUN, Cr)"

* status = #final
* category
  * coding.system = "http://terminology.hl7.org/CodeSystem/v2-0074"
  * coding.code = #LAB
* code
  * coding.system = "http://tmlt.this.or.th"
  * coding.code = #320262
  * coding.display = "Metabolic screen"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* issued = "2022-02-20T14:28:17+07:00"
* result[0] = Reference(observation-example-fbs)
* result[+] = Reference(observation-example-rbs)
* result[+] = Reference(observation-example-bun)
* result[+] = Reference(observation-example-cr)


Instance: observation-example-age
InstanceOf: NCDTHObservationVital
Title: "Observation - Age"
Description: "ตัวอย่างข้อมูลอายุของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #vital-signs
    * display = "Vital Signs"
  * text = "Vital Signs"  
* code
  * coding
    * system = $LNC
    * code = #30525-0
    * display = "Age"
  * text = "Age"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 48 'a' "years"

Instance: observation-example-bh
InstanceOf: NCDTHObservationVital
Title: "Observation - Body Height"
Description: "ตัวอย่างข้อมูลส่วนสูง (body height) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #vital-signs
    * display = "Vital Signs"
  * text = "Vital Signs"  
* code
  * coding
    * system = $LNC
    * code = #8302-2
    * display = "Body height"
  * text = "Body height"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 170 'cm' "cm"

Instance: observation-example-bmi
InstanceOf: NCDTHObservationVital
Title: "Observation - BMI"
Description: "ตัวอย่างข้อมูล body mass index (BMI) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #vital-signs
    * display = "Vital Signs"
  * text = "Vital Signs"  
* code
  * coding
    * system = $LNC
    * code = #39156-5
    * display = "Body mass index (BMI) [Ratio]"
  * text = "Body mass index (BMI)"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 23 'kg/m2' "kg/m2"

Instance: observation-example-bp
InstanceOf: NCDTHObservationVital
Title: "Observation - Blood Pressure (BP)"
Description: "ตัวอย่างข้อมูลความดันโลหิต (blood pressure) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #vital-signs
    * display = "Vital Signs"
  * text = "Vital Signs"  
* code
  * coding
    * system = $LNC
    * code = #85354-9
    * display = "Blood pressure panel with all children optional"
  * text = "Blood pressure systolic and diastolic"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* component[0]
  * code
    * coding
      * system = $LNC
      * code = #8480-6
      * display = "Systolic blood pressure"
    * text = "Systolic blood pressure"
  * valueQuantity = 120 'mm[Hg]' "mmHg"
* component[+]
  * code
    * coding
      * system = $LNC
      * code = #8462-4
      * display = "Diastolic blood pressure"
    * text = "Diastolic blood pressure"
  * valueQuantity = 80 'mm[Hg]' "mmHg"


Instance: observation-example-bw
InstanceOf: NCDTHObservationVital
Title: "Observation - Body Weight"
Description: "ตัวอย่างข้อมูลน้ำหนัก (body weight) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #vital-signs
    * display = "Vital Signs"
  * text = "Vital Signs"  
* code
  * coding
    * system = $LNC
    * code = #29463-7
    * display = "Body weight"
  * text = "Body weight"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 80 'kg' "kg"

Instance: observation-example-wc
InstanceOf: NCDTHObservationVital
Title: "Observation - Waist Circumference"
Description: "ตัวอย่างข้อมูลเส้นรอบเอว (waist circumference) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #vital-signs
    * display = "Vital Signs"
  * text = "Vital Signs"  
* code
  * coding
    * system = $LNC
    * code = #8280-0
    * display = "Waist Circumference at umbilicus by Tape measure"
  * text = "Waist Circumference"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 80 'cm' "cm"

Instance: observation-example-bun
InstanceOf: NCDTHObservationLab
Title: "Observation - BUN"
Description: "ตัวอย่างข้อมูลผลการตรวจ BUN ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320052
    * display = "Urea nitrogen [mg/dL] in Serum or Plasma"
  * text = "BUN"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 10.0 'mg/dL' "mg/dL"

Instance: observation-example-chol
InstanceOf: NCDTHObservationLab
Title: "Observation - Cholesterol"
Description: "ตัวอย่างข้อมูลผลการตรวจ Cholesterol ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320070
    * display = "Cholesterol [mg/dL] in Serum or Plasma	"
  * text = "Cholesterol"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 150 'mg/dL' "mg/dL"

Instance: observation-example-cr
InstanceOf: NCDTHObservationLab
Title: "Observation - Creatinine"
Description: "ตัวอย่างข้อมูลผลการตรวจ Cr ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320055
    * display = "Creatinine [mg/dL] in Serum or Plasma"
  * text = "Creatinine"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 0.75 'mg/dL' "mg/dL"

Instance: observation-example-fbs
InstanceOf: NCDTHObservationLab
Title: "Observation - Fasting Blood Sugar (FBS)"
Description: "ตัวอย่างข้อมูลผลการตรวจ fasting blood sugar (FBS) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320291
    * display = "Fasting glucose [mg/dL] in Serum or Plasma"
  * text = "FBS"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 100 'mg/dL' "mg/dL"

Instance: observation-example-hdl
InstanceOf: NCDTHObservationLab
Title: "Observation - HDL"
Description: "ตัวอย่างข้อมูลผลการตรวจ HDL ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320071
    * display = "Cholesterol in HDL [mg/dL] in Serum or Plasma"
  * text = "HDL"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 40 'mg/dL' "mg/dL"

Instance: observation-example-ldl
InstanceOf: NCDTHObservationLab
Title: "Observation - LDL"
Description: "ตัวอย่างข้อมูลผลการตรวจ LDL ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320293
    * display = "Cholesterol in LDL [mg/dL] in Serum or Plasma by calculation"
  * text = "LDL"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 100 'mg/dL' "mg/dL"

Instance: observation-example-rbs
InstanceOf: NCDTHObservationLab
Title: "Observation - Resting Blood Sugar (RBS)"
Description: "ตัวอย่างข้อมูลผลการตรวจ resting blood sugar (RBS) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320062
    * display = "Glucose [mg/dL] in Serum or Plasma"
  * text = "RBS"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 100 'mg/dL' "mg/dL"

Instance: observation-example-tg
InstanceOf: NCDTHObservationLab
Title: "Observation - TG"
Description: "ตัวอย่างข้อมูลผลการตรวจ triglyceride (TG) ของผู้ป่วย"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #laboratory
    * display = "Laboratory"
  * text = "Laboratory"  
* code
  * coding
    * system = $TMLT
    * code = #320072
    * display = "Triglyceride [mg/dL] in Serum or Plasma"
  * text = "Triglyceride"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 100 'mg/dL' "mg/dL"

Instance: observation-example2q
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - คัดกรองซึมเศร้า 2Q"
Description: "ตัวอย่างข้อมูลผลการตรวจคัดกรองซึมเศร้า 2 คำถาม"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #survey
    * display = "Survey"
  * text = "Survey"  
* code
  * coding
    * system = "https://www.dmh.go.th/2q"
    * code = #2q
    * display = "แบบคัดกรองซึมเศร้า 2 คำถาม"
  * text = "แบบคัดกรองซึมเศร้า 2 คำถาม"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #473126001
    * display = "Suspected depressive disorder"
  * text = "Suspected depressive disorder"

Instance: observation-example-af
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - AF"
Description: "ตัวอย่างข้อมูลผลการตรวจ Atrial Fibrillation (AF)"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #exam
    * display = "Exam"
  * text = "Exam"  
* code
  * coding
    * system = $SCT
    * code = #312442005
    * display = "History of atrial fibrillation"
  * text = "History of atrial fibrillation"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #260385009
    * display = "Negative"
  * text = "Negative for Atrial Fibrillation"

Instance: observation-example-cvd
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - CVD Risk"
Description: "ตัวอย่างข้อมูลผลการประเมินความเสี่ยงโรคจากหัวใจและหลอดเลือด (CVD risk)"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #survey
    * display = "Survey"
  * text = "Survey"  
* code
  * coding
    * system = $LNC
    * code = #99056-4
    * display = "Cardiovascular disease 10Y risk"
  * text = "Cardiovascular disease 10Y risk"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueQuantity = 16 '%' "%"

Instance: observation-example-df-screening
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - Diabetic Foot Screening"
Description: "ตัวอย่างข้อมูลผลการตรวจคัดกรองปัญหาที่เท้า ในผู้ป่วยเบาหวาน"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #exam
    * display = "Exam"
  * text = "Exam"  
* code
  * coding
    * system = $SCT
    * code = #394683006
    * display = "Diabetic foot risk assessment"
  * text = "Diabetic foot risk assessment"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #299477002
    * display = "Foot normal"
  * text = "Foot normal"

Instance: observation-example-dn-screening
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - Diabetic Nephropathy Screening"
Description: "ตัวอย่างข้อมูลผลการตรวจคัดกรองโรคไตในผู้ป่วยเบาหวาน (diabetic nephropathy)"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #exam
    * display = "Exam"
  * text = "Exam"  
* code
  * coding
    * system = $SCT
    * code = #46716003
    * display = "Urine microalbumin level"
  * text = "Urine microalbumin level"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #167583002
    * display = "Urine microalbumin negative"
  * text = "Urine microalbumin negative"

Instance: observation-example-dr-screening
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - Diabetic Retinopathy Screening"
Description: "ตัวอย่างข้อมูลผลการตรวจคัดกรองโรคจอประสาทตาในผู้ป่วยเบาหวาน (diabetic retinopathy)"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #exam
    * display = "Exam"
  * text = "Exam"  
* code
  * coding
    * system = $SCT
    * code = #134395001
    * display = "Diabetic retinopathy screening"
  * text = "Diabetic retinopathy screening"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #721103006
    * display = "Diabetic retinopathy of eye not detected"
  * text = "Diabetic retinopathy of eye not detected"



Instance: observation-example-st5
InstanceOf: NCDTHObservationPESurvey
Title: "Observation - คัดกรองซึมเศร้า ST5"
Description: "ตัวอย่างข้อมูลผลการตรวจคัดกรองซึมเศร้า ST5"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #survey
    * display = "Survey"
  * text = "Survey"  
* code
  * coding
    * system = "https://www.srithanya.go.th/st5"
    * code = #st5
    * display = "Srithanya Stress Scale"
  * text = "Srithanya Stress Scale"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #48694002
    * display = "Anxiety"
  * text = "Anxiety"

Instance: observation-example-alcohol
InstanceOf: NCDTHObservationSocial
Title: "Observation - Alcohol"
Description: "ตัวอย่างข้อมูลผลการประเมินการดื่มเครื่องดื่มแอลกอฮอล์"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #social
    * display = "Social"
  * text = "Social"  
* code
  * coding
    * system = $LNC
    * code = #11331-6
    * display = "History of Alcohol use"
  * text = "History of Alcohol use"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #704198001
    * display = "Denies alcohol use"
  * text = "Denies alcohol use"

Instance: observation-example-diet
InstanceOf: NCDTHObservationSocial
Title: "Observation - Diet"
Description: "ตัวอย่างข้อมูลผลการประเมินภาวะโภชนาการ"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #social
    * display = "Social"
  * text = "Social"  
* code
  * coding
    * system = $LNC
    * code = #81663-7
    * display = "Diet [Type]"
  * text = "Diet [Type]"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #41449007
    * display = "General diet (finding)"
  * text = "General diet"

Instance: observation-example-physical
InstanceOf: NCDTHObservationSocial
Title: "Observation - Physical Activity"
Description: "ตัวอย่างข้อมูลผลการประเมินกิจกรรมทางกายภาพ"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #social
    * display = "Social"
  * text = "Social"  
* code
  * coding
    * system = $LNC
    * code = #99285-9
    * display = "Current activity level"
  * text = "Current activity level"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #228445002
    * display = "Gets no exercise"
  * text = "Gets no exercise"

Instance: observation-example-smoking
InstanceOf: NCDTHObservationSocial
Title: "Observation - Smoking"
Description: "ตัวอย่างข้อมูลผลการประเมินการสูบบุหรี่"
* status = #final
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/observation-category"
    * code = #social
    * display = "Social"
  * text = "Social"  
* code
  * coding
    * system = $LNC
    * code = #72166-2
    * display = "Tobacco smoking status"
  * text = "Tobacco smoking status"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* effectiveDateTime = "2022-02-20T14:28:17+07:00"
* valueCodeableConcept
  * coding
    * system = $SCT
    * code = #428041000124106
    * display = "Current some day smoker"
  * text = "Current some day smoker"

Instance: allergy-intolerance-example
InstanceOf: NCDTHAllergyIntolerance
Title: "AllergyIntolerance"
Description: "ตัวอย่างข้อมูลการแพ้ยาของผู้ป่วย"
* clinicalStatus
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
    * code = #active
* verificationStatus
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
    * code = #confirmed
* category = #medication
* criticality = #low
* code
  * coding
    * system = $SCT
    * code = #763875007
    * display = "Product containing sulfonamide (product)"
* patient = Reference(patient-example)
* reaction
  * manifestation
    * coding
      * system = $SCT
      * code = #271807003
      * display = "skin rash"
  * severity = #mild

Instance: media-example
InstanceOf: NCDTHMedia
Title: "Media"
Description: "ตัวอย่างภาพแผนผังเครือญาติของผู้ป่วย"

* status = #completed
* type
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/media-type"
    * code = #image
    * display = "Image"
* modality
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/media-modality"
    * code = #diagram
    * display = "Diagram"
* subject = Reference(patient-example)
* encounter = Reference(encounter-example)
* createdDateTime = "2022-02-20T14:28:17+07:00"
* operator = Reference(Practitioner) //TODO
* content
  * contentType = #image/jpg
  * data = "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TgrDeBpzXdxVGmw5n7vF/Td9Fk4m0ktsOPJb2Cua1r7m2nNc5XFk56DD3v8AEqt/gcz93i/pu+ita4MBzJJjXtc12c/BwIPOOoqLD2kSm43H1Cnxh7TTixHzDeOBUlREW2uaRQi+lhmpmIYqDzwNX9W7apuihngbMzYd/wBKxS1LqeQPb4cQq6u5ecwaQ4lXQtW1m7aOpTqSn4UYVhva7ccRvGkKP21dBkQl8Ihjj6J5p3eqorMWLMwTXMeKek2pHBzVmslqaX4Xt2m8Rf1zt2Ed9lrvhpK07bH7Lt4/Rt4gq1CuPaV4oEEGrw4+qzE8ToCgBgzMTklsZ3UQ89635C6MxE5zRDbtcceAGPbRezXTSZRR8+QHmvH/AIuCLOaXLhpzJ8BdaVoTkWbjVIqSc1jBqGoD6qwbv2aJeEGaXHlOO0nZ1DQvxYdgQpbEcqIdLj3NGoLsKakpHMJkkN3H349mVslWr65srRFELMHn+u3O+aIiK+sxERERERERERERYYkBjtLWneAV8ZKsGhjRuaAs6Ii+BfUREREREREREREREREREREREREREXwrUdZsEmpgwyduY36LcRfCAcivrXFuhsteFLQ2c1jW7mgdy2ERALaL4STmUREX1ERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERF//2Q=="
