{{- define "service-lib.namespace" -}}
{{- if .Values.global.namespace.create }}
apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.global.namespace.name }}
  labels:
    environment: {{ .Values.global.environment }}
    {{- toYaml .Values.global.namespace.labels | nindent 4 }}
  annotations:
    {{- toYaml .Values.global.namespace.annotations | nindent 4 }}
---
apiVersion: v1
kind: ResourceQuota
metadata:
  name: quota
  namespace: {{ .Values.global.namespace.name }}
spec:
  hard:
    requests.cpu: "20"
    requests.memory: 40Gi
    limits.cpu: "40"
    limits.memory: 80Gi
    pods: "200"
---
apiVersion: v1
kind: LimitRange
metadata:
  name: limits
  namespace: {{ .Values.global.namespace.name }}
spec:
  limits:
    - type: Container
      default:
        cpu: 500m
        memory: 512Mi
      defaultRequest:
        cpu: 200m
        memory: 256Mi
{{- end }}
{{- end }}
