{{- define "service-lib.pdb" -}}
{{- if .Values.pdb.enabled }}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ include "service-lib.fullname" . }}
spec:
  minAvailable: {{ .Values.pdb.minAvailable }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "service-lib.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- end }}
