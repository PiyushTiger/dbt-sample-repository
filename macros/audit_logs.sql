{% macro audit_logs(action_name) %}

insert into {{source('test', 'audit_logs')}} (logs)
values ('{{ action_name }}')

{% endmacro %}

