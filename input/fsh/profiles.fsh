Alias: $Language = http://hl7.org/fhir/StructureDefinition/language
Alias: $ThaiID = https://bora.dopa.go.th/cid
Alias: $SCT = http://snomed.info/sct
Alias: $TMT = https://tmt.this.or.th
Alias: $TMLT = https://tmlt.this.or.th
Alias: $LNC = http://loinc.org
Alias: $vitalsignsProfile = http://hl7.org/fhir/StructureDefinition/vitalsigns

Profile: NCDTHPatient
Parent: Patient
Id: ncdth-patient
Title: "Patient (NCD TH)"
Description: "ใช้บันทึกข้อมูล demographic ของผู้ป่วย เช่น ชื่อ เลขประจำตัว ที่อยู่ เป็นต้น"
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains idNumber 1..1 MS
* identifier[idNumber].system =  $ThaiID
* identifier[idNumber].value MS
* active 1..1 MS
* name 1..* MS
  * given MS
  * family MS
* name.extension contains $Language named language 0..1 MS
* gender 1..1 MS
* birthDate 1..1 MS
* address 1..* MS
* contact MS
  * name
    * given MS
  * telecom
    * value MS

Profile: NCDTHOrganization
Parent: Organization
Id: ncdth-organization
Title: "Organization (NCD TH)"
Description: "ใช้บันทึกข้อมูลหน่วยงาน/องค์กร"
* identifier MS
* name 1..1 MS
* address MS
* telecom MS

Profile: NCDTHCoverage
Parent: Coverage
Id: ncdth-coverage
Title: "Coverage (NCD TH)"
Description: "ใช้บันทึกข้อมูลสิทธิ์การรักษา"
* identifier MS
* status MS
* type MS
* type from THGovernmentCoverageTypeVS (required)
* beneficiary MS
* period MS
* payor MS

Profile: NCDTHEpisodeOfCare
Parent: EpisodeOfCare
Id: ncdth-episode-of-care
Title: "EpisodeOfCare (NCD TH)"
Description: "ใช้จัดกลุ่มของ Encounter ประเภทเดียวกัน เช่น Encounter ทั้งหมดในการดูแลโรคเบาหวาน"
* identifier MS
  * system MS
  * value MS
* status MS
* diagnosis MS
* patient MS
* managingOrganization MS
* period MS
* careManager MS
* team MS

Profile: NCDTHEncounter
Parent: Encounter
Id: ncdth-encounter
Title: "Encounter (NCD TH)"
Description: "ใช้บันทึกข้อมูลการรับบริการสุขภาพ"
* identifier 1..* MS
  * system 1..1 MS
  * value 1..1 MS
* status MS
* class MS
* type MS
* subject 1..1 MS
* episodeOfCare MS
* participant 0..* MS
  * type MS
  * individual MS
* serviceProvider 0..1 MS

Profile: NCDTHFamilyMemberHistory
Parent: FamilyMemberHistory
Id: ncdth-family-member-history
Title: "FamilyMemberHistory (NCD TH)"
Description: "ใช้บันทึกประวัติการเจ็บป่วยในครอบครัว"

* status MS
* patient MS
* name 1..1 MS
* relationship MS
* bornDate MS
* ageAge MS
* deceasedBoolean MS
* reasonCode MS

Profile: NCDTHCondition
Parent: Condition
Id: ncdth-condition
Title: "Condition (NCD TH)"
Description: "ใช้บันทึกปัญหา (problem list) หรือการวินิจฉัย (diagnosis)"

* clinicalStatus MS
* verificationStatus MS
* category MS
* severity MS
* code 1..1 MS
* subject MS
* onset[x] MS

Profile: NCDTHDiagnosticReportLab
Parent: DiagnosticReport
Id: ncdth-diagnostic-report-lab
Title: "DiagnosticReport Profile for Lab (NCD TH)"
Description: "ใช้รายงานผลการตรวจแล็บที่มีหลายรายการย่อย (การจัดกลุ่ม Observation เช่น lab panel)"

* status MS
* status = #final (exactly)
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains LaboratorySlice 1..1 MS
* category[LaboratorySlice].coding.system 1..1
* category[LaboratorySlice].coding.code 1..1
* category[LaboratorySlice].coding.system = "http://terminology.hl7.org/CodeSystem/v2-0074" (exactly)
* category[LaboratorySlice].coding.code = #LAB (exactly)
* code MS
* code from NCDTHLaboratoryVS (required)
* subject 1..1 MS
  * reference MS
* encounter MS
* effective[x] 1..1 MS
* performer MS
* issued 1..1 MS
* result MS

Profile: NCDTHObservationVital
// Parent: $vitalsignsProfile
Parent: Observation
Id: ncdth-observation-vital
Title: "Observation Profile - Vital Signs (NCD TH)"
Description: "ใช้บันทึกข้อมูล vital signs"

* status MS
* category ..* MS
* category ^slicing.discriminator[0].type = #value
* category ^slicing.discriminator[=].path = "coding.code"
* category ^slicing.discriminator[+].type = #value
* category ^slicing.discriminator[=].path = "coding.system"
* category ^slicing.rules = #open
* category contains VSCat 1..1 MS
* insert SetObservationCat(VSCat, #vital-signs)
* insert SetObservationCodeBinding(NCDTHVitalVS, "รหัสสำหรับการวัด vital sign จาก LOINC")
* insert SetStandardObservationElements
* value[x] from http://hl7.org/fhir/ValueSet/ucum-vitals-common (extensible)
* value[x] ^short = "ค่าที่วัดได้ของ vital signs"
* value[x] ^definition = "ปกติมักใช้ data type เป็น Quantity"
* value[x] ^binding.description = "หน่วยวัดในระบบ UCUM ที่ใช้บ่อยในการบันทึกค่า vital signs"
* component MS
* component ^short = "Component ย่อยของ observations"
* component ^definition = "ใช้สำหรับ observation ที่มี component ย่อย เช่น systolic และ diastolic blood pressure"
* component.code MS
* component.code from NCDTHVitalVS (extensible)
* component.code ^binding.description = "รหัสสำหรับการวัด vital sign จาก LOINC"
* component.value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
* component.value[x] MS
* component.value[x] from http://hl7.org/fhir/ValueSet/ucum-vitals-common (extensible)
* component.value[x] ^short = "ค่าที่วัดได้ของ component ย่อยใน vital sign"
* component.value[x] ^definition = "ปกติมักใช้ data type เป็น Quantity แต่ถ้ามีข้อมูลเสริมอื่น ๆ เช่น cuff size อาจใช้ data type อื่น ๆ ได้ เช่น CodeableConcept"
* component.value[x] ^binding.description = "หน่วยวัดในระบบ UCUM ที่ใช้บ่อยในการบันทึกค่า vital signs"
* component.dataAbsentReason MS

RuleSet: SetObservationCat(SliceName, code)
* category[{SliceName}].coding 1..* MS
* category[{SliceName}].coding.system 1..1 MS
* category[{SliceName}].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
* category[{SliceName}].coding.code 1..1 MS
* category[{SliceName}].coding.code = {code} (exactly)

RuleSet: SetObservationCodeBinding(valueSet, description)
* code MS
* code from {valueSet} (extensible)
* code ^binding.description = {description}

RuleSet: SetStandardObservationElements
* subject only Reference(Patient)
* subject MS
* encounter MS
* effective[x] only dateTime or Period
* effective[x] MS
* value[x] MS
* value[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
* value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
* value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
* value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
* dataAbsentReason MS

Profile: NCDTHObservationLab
Parent: Observation
Id: ncdth-observation-lab
Title: "Observation Profile - Lab (NCD TH)"
Description: "ใช้บันทึกข้อมูลผลการตรวจแล็บแต่ละตัว"

* status MS
* category ..* MS
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[=].path = "$this"
* category ^slicing.rules = #open
* category contains Laboratory 1..1 MS
* insert SetObservationCat(Laboratory, #laboratory)
* insert SetObservationCodeBinding(NCDTHLaboratoryVS, "รหัสมาตรฐานการตรวจทางห้องปฏิบัติการ TMLT")
* insert SetStandardObservationElements

Profile: NCDTHObservationPESurvey
Parent: Observation
Id: ncdth-observation-pe-survey
Title: "Observation Profile - PE & Survey (NCD TH)"
Description: "ใช้บันทึกข้อมูลการตรวจร่างกาย และการประเมินตามแบบประเมินต่าง ๆ"

* status MS
* category ..* MS
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[=].path = "$this"
* category ^slicing.rules = #open
* category contains Exam 0..1 MS and Survey 0..1 MS
* insert SetObservationCat(Exam, #exam)
* insert SetObservationCat(Survey, #survey)
* insert SetObservationCodeBinding($LNC, "รหัสมาตรฐาน LOINC บอกชนิดการตรวจ ถ้าไม่มีใช้ code system อื่นได้ เช่น SNOMED-CT")
* insert SetStandardObservationElements

Profile: NCDTHObservationSocial
Parent: Observation
Id: ncdth-observation-social
Title: "Observation Profile - Social (NCD TH)"
Description: "ใช้บันทึกข้อมูลประวัติทางสังคมของผู้ป่วย"
* status MS
* category ..* MS
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[=].path = "$this"
* category ^slicing.rules = #open
* category contains Social 1..1 MS
* insert SetObservationCat(Social, #social)
* insert SetObservationCodeBinding($LNC, "รหัสมาตรฐาน LOINC บอกชนิดการตรวจ")
* insert SetStandardObservationElements


Profile: NCDTHAllergyIntolerance
Parent: AllergyIntolerance
Id: ncdth-allergy-intolerance
Title: "AllergyIntolerance (NCD TH)"
Description: "ใช้บันทึกข้อมูลการแพ้ยาแพ้อาหาร"
* clinicalStatus MS
* verificationStatus MS
* category MS
* criticality MS
* code 1..1 MS
* code from http://hl7.org/fhir/ValueSet/allergyintolerance-code (extensible)
* patient MS
* reaction MS
  * manifestation MS
  * manifestation from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)

Profile: NCDTHMedia
Parent: Media
Id: ncdth-media
Title: "Media (NCD TH)"
Description: "ใช้บันทึกรูปประกอบ ในที่นี้เช่น แผนผังครอบครัว"

* type MS
* modality MS
* subject MS
* encounter MS
* createdDateTime MS
* operator MS
* content MS

