resource "random_string" "unique_id" {
  length    = 5
  min_lower = 5
  special   = false
}

resource "google_service_account" "cloudbase_service_account" {
  account_id   = "cloudbase-sa-${random_string.unique_id.result}"
  display_name = "Cloudbase Service Account"
  project      = var.project_id
}

resource "google_project_iam_custom_role" "cloudbase_project_custom_role" {
  project     = var.project_id
  role_id     = "cloudbaseViewer${random_string.unique_id.result}"
  title       = "Cloudbase Viewer ${random_string.unique_id.result}"
  permissions = var.cloudbase_role_permissions
}

resource "google_project_iam_member" "bind_security_reviewer_role" {
  project = var.project_id
  role    = "roles/iam.securityReviewer"
  member  = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

resource "google_project_iam_member" "bind_cloudbase_custom_role" {
  project = var.project_id
  role    = "projects/${var.project_id}/roles/${google_project_iam_custom_role.cloudbase_project_custom_role.role_id}"
  member  = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

###################
# Enable Services
###################
locals {
  is_enable_all = var.enable_all_apis ? [
    "accessapproval.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "advisorynotifications.googleapis.com",
    "agentregistry.googleapis.com",
    "aiplatform.googleapis.com",
    "alloydb.googleapis.com",
    "analyticshub.googleapis.com",
    "apigateway.googleapis.com",
    "apigee.googleapis.com",
    "apigeeconnect.googleapis.com",
    "apigeeregistry.googleapis.com",
    "apihub.googleapis.com",
    "apikeys.googleapis.com",
    "apim.googleapis.com",
    "appengine.googleapis.com",
    "apphub.googleapis.com",
    "assuredworkloads.googleapis.com",
    "auditmanager.googleapis.com",
    "autoscaling.googleapis.com",
    "backupdr.googleapis.com",
    "baremetalsolution.googleapis.com",
    "beyondcorp.googleapis.com",
    "biglake.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerymigration.googleapis.com",
    "bigtableadmin.googleapis.com",
    "capacityplanner.googleapis.com",
    "chronicle.googleapis.com",
    "cloudaicompanion.googleapis.com",
    "cloudapiregistry.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudcommerceconsumerprocurement.googleapis.com",
    "cloudcontrolspartner.googleapis.com",
    "clouderrorreporting.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudoptimization.googleapis.com",
    "cloudprofiler.googleapis.com",
    "cloudquotas.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudsecuritycompliance.googleapis.com",
    "cloudsupport.googleapis.com",
    "cloudtrace.googleapis.com",
    "confidentialcomputing.googleapis.com",
    "configdelivery.googleapis.com",
    "connectors.googleapis.com",
    "contactcenteraiplatform.googleapis.com",
    "contactcenterinsights.googleapis.com",
    "containeranalysis.googleapis.com",
    "contentwarehouse.googleapis.com",
    "databasecenter.googleapis.com",
    "databaseinsights.googleapis.com",
    "datacatalog.googleapis.com",
    "dataconnectors.googleapis.com",
    "dataform.googleapis.com",
    "datamigration.googleapis.com",
    "datastore.googleapis.com",
    "datastream.googleapis.com",
    "deploymentmanager.googleapis.com",
    "designcenter.googleapis.com",
    "dialogflow.googleapis.com",
    "documentai.googleapis.com",
    "earthengine.googleapis.com",
    "edgenetwork.googleapis.com",
    "enterpriseknowledgegraph.googleapis.com",
    "enterprisepurchasing.googleapis.com",
    "essentialcontacts.googleapis.com",
    "eventarc.googleapis.com",
    "fcmdata.googleapis.com",
    "firebase.googleapis.com",
    "firebaseappcheck.googleapis.com",
    "firebaseappdistribution.googleapis.com",
    "firebasecrashlytics.googleapis.com",
    "firebasedatabase.googleapis.com",
    "firebasedataconnect.googleapis.com",
    "firebaseextensions.googleapis.com",
    "firebaseextensionspublisher.googleapis.com",
    "firebasehosting.googleapis.com",
    "firebaseinappmessaging.googleapis.com",
    "firebaseml.googleapis.com",
    "firebaserules.googleapis.com",
    "firebasestorage.googleapis.com",
    "firebasevertexai.googleapis.com",
    "gdchardwaremanagement.googleapis.com",
    "geminicloudassist.googleapis.com",
    "geminidataanalytics.googleapis.com",
    "gkebackup.googleapis.com",
    "gkehub.googleapis.com",
    "gkemulticloud.googleapis.com",
    "gkeonprem.googleapis.com",
    "gsuiteaddons.googleapis.com",
    "hypercomputecluster.googleapis.com",
    "iam.googleapis.com",
    "iamconnectors.googleapis.com",
    "iap.googleapis.com",
    "identitytoolkit.googleapis.com",
    "ids.googleapis.com",
    "licensemanager.googleapis.com",
    "livestream.googleapis.com",
    "logging.googleapis.com",
    "looker.googleapis.com",
    "lustre.googleapis.com",
    "mapsplatformdatasets.googleapis.com",
    "memorystore.googleapis.com",
    "migrationcenter.googleapis.com",
    "ml.googleapis.com",
    "modelarmor.googleapis.com",
    "monitoring.googleapis.com",
    "netapp.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networkmanagement.googleapis.com",
    "networkservices.googleapis.com",
    "observability.googleapis.com",
    "opsconfigmonitoring.googleapis.com",
    "orgpolicy.googleapis.com",
    "parallelstore.googleapis.com",
    "parametermanager.googleapis.com",
    "paymentsresellersubscription.googleapis.com",
    "policyanalyzer.googleapis.com",
    "policyremediatormanager.googleapis.com",
    "policysimulator.googleapis.com",
    "privateca.googleapis.com",
    "privilegedaccessmanager.googleapis.com",
    "pubsub.googleapis.com",
    "pubsublite.googleapis.com",
    "readerrevenuesubscriptionlinking.googleapis.com",
    "recaptchaenterprise.googleapis.com",
    "recommender.googleapis.com",
    "runtimeconfig.googleapis.com",
    "saasservicemgmt.googleapis.com",
    "securesourcemanager.googleapis.com",
    "securitycenter.googleapis.com",
    "securitycentermanagement.googleapis.com",
    "securityposture.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "servicedirectory.googleapis.com",
    "servicehealth.googleapis.com",
    "servicemanagement.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "sourcerepo.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "storagebatchoperations.googleapis.com",
    "storageinsights.googleapis.com",
    "storagetransfer.googleapis.com",
    "subscribewithgoogledeveloper.googleapis.com",
    "testing.googleapis.com",
    "threatintelligence.googleapis.com",
    "toolresults.googleapis.com",
    "trafficdirector.googleapis.com",
    "transferappliance.googleapis.com",
    "vectorsearch.googleapis.com",
    "visionai.googleapis.com",
    "vmmigration.googleapis.com",
    "vmwareengine.googleapis.com",
    "websecurityscanner.googleapis.com",
  ] : []
}

resource "google_project_service" "optional" {
  for_each           = toset(local.is_enable_all)
  project            = var.project_id
  service            = each.key
  disable_on_destroy = false
}
