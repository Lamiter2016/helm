🎯 Cách sử dụng trong Service Chart

Trong chart service:
{{ include "service-lib.namespace" . }}
{{ include "service-lib.deployment" . }}
{{ include "service-lib.service" . }}
{{ include "service-lib.ingress" . }}
{{ include "service-lib.hpa" . }}
{{ include "service-lib.pdb" . }}
{{ include "service-lib.networkpolicy" . }}
{{ include "service-lib.servicemonitor" . }}