#!/bin/bash

cat <<EOF > credentials
[default]
aws_access_key_id = minio
aws_secret_access_key = minio123
EOF

velero install \
    --namespace velero \
    --provider aws \
    --bucket default \
    --secret-file credentials \
    --use-volume-snapshots=false \
    --use-restic=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.minio.svc:9000,publicUrl=http://minio.noverit.com:9000
