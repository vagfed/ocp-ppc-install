#!/bin/bash 

../ocp/oc get csr -o go-template='{{range .items}}{{if not .status}}{{.metadata.name}}{{"\n"}}{{end}}{{end}}' | xargs -r ../ocp/oc adm certificate approve 
