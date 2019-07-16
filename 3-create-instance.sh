gcloud compute instances create  gce-windows-env-variable \
    --zone=$ZONE \
    --machine-type $MACHINE_TYPE \
    --image=windows-server-2019-dc-v20190709 \
    --image-project=windows-cloud \
     --metadata-from-file windows-startup-script-ps1=startup.ps1