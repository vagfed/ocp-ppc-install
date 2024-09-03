#!/bin/bash 

../oc get csr -o go-template='{{range .items}}{{if not .status}}{{.metadata.name}}{{"\n"}}{{end}}{{end}}' | xargs -r ../oc adm certificate approve 
