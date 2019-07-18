# gcp-compute-environment-variable

Set environment variable on GCP Compute Windows instance

## Clone repository

```bash
git clone https://github.com/reisbel/gcp-compute-environment-variable.git && cd gcp-compute-environment-variable
```

## Setup demo variables

```bash
#Execute this on Cloud Shell
export CUSTOM_VARIABLE=Hello-World
export ZONE=us-central1-c
export MACHINE_TYPE=n1-standard-1
```

## Create startup script file

```bash
cat | envsubst '$CUSTOM_VARIABLE' > startup.ps1 << 'EOF'
# Add environment variable
[Environment]::SetEnvironmentVariable( `
  "CUSTOM_VARIABLE", "$CUSTOM_VARIABLE", `
  [System.EnvironmentVariableTarget]::Machine)
EOF
```

## Create instance

```bash
gcloud compute instances create  gce-windows-env-variable \
    --zone=$ZONE \
    --machine-type $MACHINE_TYPE \
    --image=windows-server-2019-dc-v20190709 \
    --image-project=windows-cloud \
     --metadata-from-file windows-startup-script-ps1=startup.ps1
```

## Verify variable

Connect to the Windows instance and execute the following command to verify the presence of the configured environment variable.

```poweshell
gci env:* | sort-object name
```

Output

![alt text](https://user-images.githubusercontent.com/247003/61329231-d5a42100-a7ea-11e9-93ea-afac67a9e1fd.jpeg "Instance environment variables ")

## Cleanup

To avoid unexpected changes, remember to delete create resources.

```bash
gcloud compute instances delete $INSTANCE_NAME --zone=$ZONE
```

## License

MIT - See [LICENSE](LICENSE) for more information.

## References

- [Documentation about Connecting to instances on GCP](https://cloud.google.com/compute/docs/instances/connecting-to-instance "Title")

- [Running Startup Scripts](https://cloud.google.com/compute/docs/startupscript "Title")
