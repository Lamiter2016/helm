{{- define "service-lib.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "service-lib.fullname" . }}
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "service-lib.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  revisionHistoryLimit: {{ .Values.revisionHistoryLimit }}
  strategy:
    type: {{ .Values.strategy.type }}
    rollingUpdate:
      maxUnavailable: {{ .Values.strategy.rollingUpdate.maxUnavailable }}
      maxSurge: {{ .Values.strategy.rollingUpdate.maxSurge }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "service-lib.name" . }}
  template:
    metadata:
      labels:
        {{- include "service-lib.labels" . | nindent 8 }}
    spec:
      terminationGracePeriodSeconds: {{ .Values.terminationGracePeriodSeconds }}
      priorityClassName: {{ .Values.priorityClassName }}
      topologySpreadConstraints:
        {{- toYaml .Values.topologySpreadConstraints | nindent 8 }}
      containers:
        - name: app
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - containerPort: 8080
{{- end }}
