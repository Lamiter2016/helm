{{- define "service-lib.name" -}}
{{- default .Chart.Name .Values.nameOverride | default "NoName" -}}
{{- end }}

{{- define "service-lib.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "service-lib.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "service-lib.labels" -}}
app.kubernetes.io/name: {{ include "service-lib.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end }}
