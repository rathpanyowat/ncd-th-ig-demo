Alias: $Language = http://hl7.org/fhir/StructureDefinition/language
Alias: $ThaiID = https://bora.dopa.go.th/cid

Profile: NCDTHPatient
Parent: Patient
Id: ncdth-patient
Title: "NCD Thailand Patient Profile"
Description: "Profile สำหรับ Patient resource"
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
Title: "NCD Thailand Organization Profile"
Description: "Profile สำหรับ Organization resource"
* identifier MS
* name 1..1 MS
* address MS
* telecom MS

Profile: NCDTHCoverage
Parent: Coverage
Id: ncdth-coverage
Title: "NCD Thailand Coverage Profile"
Description: "Profile สำหรับ Coverage resource"
* identifier MS
* status 1..1 MS
* type MS
* type from THGovernmentCoverageTypeVS (required)
* beneficiary MS
* period MS
* payor MS

Profile: NCDTHEpisodeOfCare
Parent: EpisodeOfCare
Id: ncdth-episode-of-care
Title: "NCD Thailand EpisodeOfCare Profile"
Description: "Profile สำหรับ EpisodeOfCare resource"

Profile: NCDTHEncounter
Parent: Encounter
Id: ncdth-encounter
Title: "NCD Thailand Encounter Profile"
Description: "Profile สำหรับ Encounter resource"

Profile: NCDTHFamilyMemberHistory
Parent: FamilyMemberHistory
Id: ncdth-family-member-history
Title: "NCD Thailand FamilyMemberHistory Profile"
Description: "Profile สำหรับ FamilyMemberHistory resource"

Profile: NCDTHCondition
Parent: Condition
Id: ncdth-condition
Title: "NCD Thailand Condition Profile"
Description: "Profile สำหรับ Condition resource"

Profile: NCDTHDiagnosticReportLab
Parent: DiagnosticReport
Id: ncdth-diagnostic-report-lab
Title: "NCD Thailand DiagnosticReport Profile for Lab Report"
Description: "Profile สำหรับ DiagnosticReport resource"

Profile: NCDTHObservation
Parent: Observation
Id: ncdth-observation
Title: "NCD Thailand Observation Profile"
Description: "Profile สำหรับ Observation resource"

Profile: NCDTHAllergyIntolerance
Parent: AllergyIntolerance
Id: ncdth-allergy-intolerance
Title: "NCD Thailand AllergyIntolerance Profile"
Description: "Profile สำหรับ AllergyIntolerance resource"

Profile: NCDTHMedia
Parent: Media
Id: ncdth-media
Title: "NCD Thailand Media Profile"
Description: "Profile สำหรับ Media resource"


