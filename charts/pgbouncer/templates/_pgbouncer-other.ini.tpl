{{- define "pgbouncer-other.ini" -}}
{{- range $k, $v := .Values.extraSettings -}}
{{ $k }} = {{ $v }}
{{- end -}}
{{- end -}}
