{{- define "service-lib.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "service-lib.fullname" . }}
  annotations:
    {{- toYaml .Values.service.annotations | nindent 4 }}
  labels:
    {{- include "service-lib.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  selector:
    app.kubernetes.io/name: {{ include "service-lib.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: {{ .Values.service.targetPort }}
{{- end }}
