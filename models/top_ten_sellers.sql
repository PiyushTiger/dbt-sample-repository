{{ config(materialized='table') }}

{{ config(
  pre_hook = "insert into {{source('test', 'audit_logs')}} (logs) values ('model_start')",
  post_hook = "insert into {{source('test', 'audit_logs')}} (logs) values ('model_end')"
) }}

with table_join as (
  {{ join_tables(ref('sellers_sales'), ref('dim_customers'), 'sellerid', 'userid','join') }}
)

select sellerid, username, (firstname ||' '|| lastname) as name,
city, email, phone, sum(qtysold) as total_qtysold, max(saletime) as recent_saletime, sum(commission) as total_commission from table_join where city = 'San Diego'
-- group_by(built-in macro) from dbt_utils package which takes only one argument i.e no of columns to group
{{ dbt_utils.group_by(6) }}
order by 7 desc
limit 10

