# Create the storage bucket
resource "google_storage_bucket" "my_bucket" {
  name          = "my-valid-storage-bucket"
  location      = "US"  # e.g., "US" or "EUROPE-WEST3"
  force_destroy = true # Be cautious with this, it allows Terraform to delete the bucket and its contents if you destroy this resource

  # Optional: Add more bucket configuration if needed, such as:
  # uniform_bucket_level_access = true 
  # versioning {
  #   enabled = true
  # }
}

# Create the "mlruns" folder within the bucket (by uploading an empty object)
resource "google_storage_bucket_object" "mlruns_folder" {
  name   = "mlruns/" 
  bucket = google_storage_bucket.my_bucket.name
  content= "" # Empty content to create a folder-like object
}