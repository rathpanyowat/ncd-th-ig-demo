ValueSet: THGovernmentCoverageTypeVS
Id: th-gov-coverage-type-vs
Title: "Thai Government Coverage Type Value Set"
Description: "รหัสประเภทสิทธิ์การรักษาพยาบาลภาครัฐของไทย รวมกับรหัสที่ HL7 กำหนด"
* include codes from system THGovernmentCoverageTypeCS
* include codes from valueset http://hl7.org/fhir/ValueSet/coverage-type

CodeSystem: THGovernmentCoverageTypeCS
Id: th-gov-coverage-type-cs
Title: "Thai Government Coverage Type Code System"
Description: "รหัสประเภทสิทธิ์การรักษาพยาบาลภาครัฐของไทย"
* #UC "Universal Coverage" "ประกันสุขภาพถ้วนหน้า"
* #SS "Social Security" "ประกันสังคม"
* #CS "Civil Servant Medical Benefit Scheme" "รักษาพยาบาลข้าราชการ"

ValueSet: NCDTHLaboratoryVS
Id: ncdth-lab-vs
Title: "NCD TH Laboratory Value Set"
Description: "รหัสมาตรฐานการตรวจทางห้องปฏิบัติการที่ใช้ใน NCD IG"
* include codes from system http://tmlt.this.or.th

ValueSet: NCDTHVitalVS
Id: ncdth-vital-vs
Title: "NCD TH Vital Signs Value Set"
Description: "รหัสจากระบบ LOINC ในการบันทึกชนิดการตรวจ vital signs"
* include $LNC#30525-0 "Age"
* include codes from valueset http://hl7.org/fhir/ValueSet/observation-vitalsignresult

// ValueSet: SCTGPS
// Id: sct-gps-vs
// Title: "NCD TH Laboratory Value Set"
// Description: "รหัสมาตรฐานการตรวจทางห้องปฏิบัติการที่ใช้ใน NCD IG"
// * include codes from system http://tmlt.this.or.th

// ValueSet: IPSAllergyVS
// Id: ips-allergy-vs
// Title: "NCD TH Laboratory Value Set"
// Description: "รหัสมาตรฐานการตรวจทางห้องปฏิบัติการที่ใช้ใน NCD IG"
// * include codes from system http://tmlt.this.or.th