{{- define "service-lib.servicemonitor" -}}
{{- if .Values.serviceMonitor.enabled }}
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ include "service-lib.fullname" . }}
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "service-lib.name" . }}
  endpoints:
    - port: http
      path: {{ .Values.serviceMonitor.path }}
      interval: {{ .Values.serviceMonitor.interval }}
{{- end }}
{{- end }}
