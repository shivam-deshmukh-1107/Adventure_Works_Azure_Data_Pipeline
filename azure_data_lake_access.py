from azure.storage.blob import BlobServiceClient

# Connection details
CONNECTION_STRING = "ConnectionKey"
CONTAINER_NAME = "silver"  # Replace with your container name
BLOB_NAME = "your-blob-name"  # Replace with the blob you want to download

try:
    # Connect to the Blob Service
    blob_service_client = BlobServiceClient.from_connection_string(CONNECTION_STRING)

    # Access the container
    container_client = blob_service_client.get_container_client(CONTAINER_NAME)

    # List all blobs in the container
    print(f"Blobs in container '{CONTAINER_NAME}':")
    for blob in container_client.list_blobs():
        print(f" - {blob.name}")

    # Download a specific blob
    blob_client = container_client.get_blob_client(BLOB_NAME)
    download_file_path = f"./{BLOB_NAME}"

    print(f"\nDownloading blob '{BLOB_NAME}' to '{download_file_path}'...")
    with open(download_file_path, "wb") as download_file:
        download_file.write(blob_client.download_blob().readall())

    print("Download completed.")

except Exception as ex:
    print(f"An error occurred: {ex}")
