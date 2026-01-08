{{/*
Expand the name of the chart.
*/}}
{{- define "agentic-claims-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "agentic-claims-demo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "agentic-claims-demo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "agentic-claims-demo.labels" -}}
helm.sh/chart: {{ include "agentic-claims-demo.chart" . }}
{{ include "agentic-claims-demo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "agentic-claims-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agentic-claims-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Get cluster domain
*/}}
{{- define "agentic-claims-demo.clusterDomain" -}}
{{- .Values.global.clusterDomain }}
{{- end }}

{{/*
Get namespace
*/}}
{{- define "agentic-claims-demo.namespace" -}}
{{- .Values.global.namespace }}
{{- end }}

{{/*
Get image registry
*/}}
{{- define "agentic-claims-demo.imageRegistry" -}}
{{- .Values.global.imageRegistry }}
{{- end }}

{{/*
Build full image name
*/}}
{{- define "agentic-claims-demo.image" -}}
{{- $registry := .registry -}}
{{- $repository := .repository -}}
{{- $tag := .tag -}}
{{- printf "%s/%s:%s" $registry $repository $tag }}
{{- end }}
