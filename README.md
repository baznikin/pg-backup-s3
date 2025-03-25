# pg-backup-s3

## Environment variables

* HOST - Postgresql host to connect to
* PGPASSWD - standard `psql` variable with password to access Postgresql
* BUCKET - S3 bucket to upload dumps
* S3_<S3CMD_CONFIG_OPTION> - any s3cmd options, prepended with `S3_`

## Installing

See example manifests in `./k8s-example/`
