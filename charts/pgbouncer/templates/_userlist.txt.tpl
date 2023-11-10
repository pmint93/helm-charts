{{- define "userlist.txt" -}}
{{- range $user := .Values.users -}}
{{ $user.name | quote }} {{ $user.password | quote }}
{{- end -}}
{{- end -}}
