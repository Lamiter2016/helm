{{- define "service-lib.networkpolicy" -}}
{{- if .Values.networkPolicy.enabled }}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ include "service-lib.fullname" . }}
spec:
  podSelector:
    matchLabels:
      app.kubernetes.io/name: {{ include "service-lib.name" . }}
  policyTypes:
    - Ingress
    - Egress
{{- end }}
{{- end }}